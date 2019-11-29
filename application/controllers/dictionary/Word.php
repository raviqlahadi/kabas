<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Word extends Admin_Controller {

    private $name = null;
    private $parent_page = 'dictionary';
    private $current_page = 'dictionary/word';
    private $form_data = null; //array containner untuk menyimpan attribute untuk form 
    private $data_type = null; //array containner tipe data (ex. text, password, select) untuk inputan
    private $label = null; //array containner untuk label (buat label form dan tabel)

    public function __construct(){
        parent::__construct();
		//set attribute untuk inputan
        $this->name = $this->attribute();
		
		//set data type
        $this->data_type = $this->data_type();
        
		//set label
		$this->label = $this->label();
        
		//set form data
		$this->form_data = $this->form_data();
        
		//load model
        $this->load->model(array('m_word'));
    }


    public function index(){
        //basic variable
        $key = $this->input->get('key');
        $page = ($this->uri->segment(4)) ? ($this->uri->segment(4) - 1) : 0;
        $tabel_cell = ['id','name','language_name','first_name','status'];
        //pagination parameter
        $pagination['base_url'] = base_url($this->current_page) .'/index';
        $pagination['total_records'] = (isset($key)) ? $this->m_word->search_count($key, $this->name) : $this->m_word->get_total();
        $pagination['limit_per_page'] = 10;
        $pagination['start_record'] = $page*$pagination['limit_per_page'];
        $pagination['uri_segment'] = 4;
        //set pagination
        if ($pagination['total_records']>0) $this->data['links'] = $this->setPagination($pagination);


        //fetch data from database
        $fetch['select'] = ['id','name','type','translation','description','example','status'];;
        $fetch['select_join'] = [ 'table_languages.name as language_name', 
                                  'table_dialects.name as dialect_name', 
                                  'table_wordtypes.name as type_name',
                                  't.name as parent_name',
                                  'table_users.first_name',
                                  'table_users.last_name'
                                ];

        $fetch['join'] = [ array('table'=>'table_languages','id'=>'language_id','join'=>'left'),
                           array('table'=>'table_dialects','id'=>'dialect_id','join'=>'left'),
                           array('table'=>'table_wordtypes','id'=>'type','join'=>'left'),
                           array('table'=>'table_users','id'=>'contributor_id','join'=>'left'),
                           array('table'=>'table_words t','id'=>'parent_id','join'=>'left','previx'=>'t')];

        $fetch['start'] = $pagination['start_record'];
        $fetch['limit'] = $pagination['limit_per_page'];
        $fetch['like'] = ($key!=null) ? array("name" => array('table_words.name','table_languages.name','table_users.first_name','table_users.last_name'), "key" => $key) : null;
        $fetch['order'] = array("field"=>"id","type"=>"DESC");
        $for_table = $this->m_word->fetch($fetch);

        //get flashdata
        $alert = $this->session->flashdata('alert');
        $this->data["key"] = ($key!=null) ? $key : false;
        $this->data["alert"] = (isset($alert)) ? $alert : NULL ;
        $this->data["for_table"] = $for_table;
        $this->data["table_header"] = $this->tabel_header($tabel_cell);
        $this->data["number"] = $pagination['start_record'];
        $this->data["current_page"] = $this->current_page;
        $this->data["block_header"] = "Manajemen Kata";
        $this->data["header"] = "TABLE KATA";
        $this->data["sub_header"] = 'Klik Tombol Action Untuk Aksi Lebih Lanjut';
        //$data['word'] = $this->m_word->word($this->session->worddata('word_id'));
        //$data['subword'] = $this->m_word->subword($this->session->worddata('word_id'));

        $this->render( "dictionary/word/content");
    }


    public function create(){
      if($this->input->post()!=null){ //jika post data
		//load validation rules
        $this->form_validation->set_rules($this->validation_config());
        if($this->form_validation->run() === TRUE){ //jika validation success
            $input_data = $this->input->post();
            $input_data['contributor_id'] = $this->session->userdata('id');
            $insert = $this->insert($input_data); //kirin data ke fungsi insert
            if($insert){ //jiksa insert berhasil
              $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Input data berhasil'));
              redirect($this->current_page);
            }else{
				$this->session->set_flashdata('alert', $this->alert->set_alert(Alert::DANGER, 'Terjadi Kesalahan'));
			  //load form data dengan value untuk di tampilkan kembali
              $form = $this->form_data();
            }
        }else {
		  //jika validation gagal. set alert dan masukan value kembali ke dalam form 
          $alert = $this->errorValidation(validation_errors());
          $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, $alert);
          $form = $this->form_data();
        }
      }else{
		 // tidak post data, waktu pertama load halaman input
        $form = $this->form_data;
      }

      $this->data['form_data'] = $form;
      $this->data['form_action'] = site_url($this->current_page.'/create');
      $this->data['name'] = $this->name;
      $this->data['parent_page'] = $this->current_page;
      $this->data["block_header"] = "Word Management";
      $this->data["header"] = "Tambah Word";
      $this->data["sub_header"] = 'Tekan Tombol Simpan Ketika Selesai Mengisi Form';
      $this->render( "dictionary/word/create");
    }

    public function insert($data) {
		//memasukan data ke dalam database
      $insert = $this->m_word->add($data);
      return $insert;
    }

    public function edit($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_word->getWhere($w);
      if($form_value==false){
        redirect($this->current_page);
      }else{
        $form_value = $form_value[0];
      }

      if($this->input->post()!=null){
        $this->form_validation->set_rules($this->validation_config());
        if($this->form_validation->run() === TRUE){
            $input_data = $this->input->post();
            $input_data['status'] = 0;
            $input_data['contributor_id'] = $this->session->userdata('id');
            $update = $this->update($id, $input_data);
            if($update){
              $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Update data berhasil'));
              redirect($this->current_page);
            }else{
              $form = $this->form_data();
            }
        }else{
          $alert = $this->errorValidation(validation_errors());
          $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, $alert);
          $form = $this->form_data();
        }
      }else{
        $form = $this->form_data($form_value);
      }

      if($form_value->status==2){
        $this->data['alert'] = $this->alert->set_alert(Alert::SUCCESS, '<b>Revisi: </b>'.$form_value->revision);
      }

      $this->data['form_data'] = $form;
      $this->data['form_action'] = site_url($this->current_page.'/edit/'.$id);
      $this->data['name'] = $this->name;
      $this->data['parent_page'] = $this->current_page;
      $this->data["block_header"] = "Word Management";
      $this->data["header"] = "Ubah Word";
      $this->data["sub_header"] = 'Silahkan ubah data yang ingin anda ganti';
      $this->render( "dictionary/word/edit");
    }

    public function update($id, $data) {
      $insert = $this->m_word->update($id, $data);
      return $insert;
    }


    public function detail($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_word->getWhere($w);
      if($form_value==false){
        redirect($this->current_page);
      }else{
        $form_value = $form_value[0];
      }

      $this->data['form_data'] = $this->form_data($form_value);
      $this->data['parent_page'] = $this->current_page;
      $this->data['name'] = $this->name;
      $this->data['detail'] = true;
      $this->data["block_header"] = "Word Management";
      $this->data["header"] = "Detail Word";
      $this->data["sub_header"] = 'Halaman Ini Hanya Berisi Informasi Detail Dari Data';
      $this->render("dictionary/word/detail");
    }

    public function delete($id) {
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $delete = $this->m_word->delete($w);
      if($delete!=false){
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Delete data berhasil'));
        redirect($this->current_page);
      }else{
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::WARNING, 'Terjadi Kesalahan'));
        redirect($this->current_page);
      }

    }
	
	//attribute data yang ada di database
    private function attribute(){
      return [
      'id','parent_id','language_id', 'dialect_id', 'name', 'type', 'translation', 'description','example', 'audio',  'status',  'revision'
      ];
    }

    private function label(){
      $name = $this->name;
      $label = [
        'Id Kata',
        'Turunan Dari',
        'Bahasa',
        'Dialek',
        'Kata',
        'Tipe',
        'Arti',
        'Deskripsi',
        'Contoh',
        'Audio',
        'Status',
        'Revisi'
      ];
	  //memasukan label ke attribute
      $label_arr = array();
      foreach ($name as $key => $value) {
        $label_arr[$value] = $label[$key];
      }
      $label_arr['language_name'] = 'Bahasa';
      $label_arr['dialect_name'] = 'Dialek';
      $label_arr['type_name'] = 'Jenis';
      $label_arr['parent_name'] = 'Turunan Dari';
      $label_arr['first_name'] = 'Kontributor';
      return $label_arr;
    }
	
	//data type inputan
    private function data_type(){
      $name = $this->name;
      $type = [
        'number',
        'select',
        'select',
        'select',
        'text',
        'select',
        'text',
        'textarea',
        'textarea',
        'file',
        'select',
        'textarea',
      ];
      $type_arr = array();
      foreach ($name as $key => $value) {
        $type_arr[$value] = $type[$key];
      }
      return $type_arr;
    }
	
	//valdation rules. default semua inputan required
    private function validation_config(){
        $arr_con = [];
        $name = $this->name;
        unset($name[0],$name[9],$name[10],$name[11]);
        foreach ($name as $key => $value) {
            $arr = array(
              'field' => $value,
    					'label' => $this->label[$value],
    					'rules' =>  'trim|required',
              'errors' => array(
                          'required' => 'Field %s tidak boleh kosong  .',
                  )
            );
            array_push($arr_con, $arr);

        }

    		return $arr_con;
  	}
	
	//form data menggunakan form builder ci
    private function form_data($form_value=null){
        
		//memasukan attribute untuk select
        $select['type'] = $this->getWordType();
        $select['parent_id'] = $this->getWord();
        $select['language_id'] = $this->getLang();
        $select['dialect_id'] = $this->getDialect();
        $name = $this->name; 
        unset($name[0],$name[9],$name[10],$name[11]);
    	foreach ($name as $key => $value) {
          if($form_value!=null){
            $val = $form_value->{$value};
          }else{
            $val = $this->form_validation->set_value($value);
          }
          switch ($this->data_type[$value]) {
            case 'select':
              $data[$value] = array(
                'name' => $value,
                'label' => $value,
                'id' => $value,
                'type' => $this->data_type[$value],
                'placeholder' => $this->label[$value],
                'option' => $select[$value],
                'class' => 'form-control show-tick',
                'data-live-search' => "true",
                'value' => $val,
              );
              break;

            default:
              $data[$value] = array(
                'name' => $value,
                'label' => $value,
                'id' => $value,
                'type' => $this->data_type[$value],
                'placeholder' => $this->label[$value],
                'class' => 'form-control',
                'value' => $val,
              );
              break;
          }

        };


    		return $data;
  	}

    private function tabel_header($arr){
      $label = [];
      foreach ($arr as $key => $value) {
        $label[$value] = $this->label[$value];
      }
      if(isset($label['id'])) unset($label['id']);
      return $label;
    }

    private function getLang(){
      $this->load->model(array('m_language'));
      $all_lang =  $this->m_language->get();
      $arr = array();
      foreach ($all_lang as $key => $value) {
        $arr[$value->id] = $value->name;
      }
      return $arr;
    }
    private function getDialect(){
      $this->load->model(array('m_dialect'));
      $all_type =  $this->m_dialect->get();
      $arr = array(0=>'Biarkan Kosong');
      foreach ($all_type as $key => $value) {
        $arr[$value->id] = $value->name;
      }
      return $arr;
    }
    private function getWord(){
      $this->load->model(array('m_word'));
      $all_type =  $this->m_word->get();
      $arr = array(0=>'Biarkan Kosong');
      foreach ($all_type as $key => $value) {
        $arr[$value->id] = $value->name;
      }
      return $arr;
    }

    private function getWordType(){
      $this->load->model(array('m_wordtype'));
      $all_type =  $this->m_wordtype->get();
      $arr = array();
      foreach ($all_type as $key => $value) {
        $arr[$value->id] = $value->name;
      }
      return $arr;
    }

}
