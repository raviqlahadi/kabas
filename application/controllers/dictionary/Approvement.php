<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Approvement extends Admin_Controller {

    private $name = null;
    private $parent_page = 'dictionary';
    private $current_page = 'dictionary/approvement';
    private $form_data = null;
    private $data_type = null;
    private $label = null;

    public function __construct(){
        parent::__construct();
        $this->name = $this->attribute();
        $this->data_type = $this->data_type();
        $this->label = $this->label();
        $this->form_data = $this->form_data();
        $this->label = $this->label();
        $this->load->model(array('m_word'));
    }


    public function index(){
        //basic variable
        $key = $this->input->get('key');
        $page = ($this->uri->segment(4)) ? ($this->uri->segment(4) - 1) : 0;
         $tabel_cell = ['id','name','language_name','status'];
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
                                  't.name as parent_name' ];

        $fetch['join'] = [ array('table'=>'table_languages','id'=>'language_id','join'=>'left'),
                           array('table'=>'table_dialects','id'=>'dialect_id','join'=>'left'),
                           array('table'=>'table_wordtypes','id'=>'type','join'=>'left'),
                           array('table'=>'table_words t','id'=>'parent_id','join'=>'left','previx'=>'t')];

        $fetch['start'] = $pagination['start_record'];
        $fetch['limit'] = $pagination['limit_per_page'];
        $fetch['where'] = ['table_words.status'=>'0'];
        $fetch['like'] = ($key!=null) ? array("name" => array('table_words.name','table_languages.name'), "key" => $key) : null;
        $fetch['order'] = array("field"=>"id","type"=>"ASC");
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
        $this->data["header"] = "Periksa Kata Baru";
        $this->data["sub_header"] = 'Klik Tombol Action Untuk Aksi Lebih Lanjut';
        //$data['word'] = $this->m_word->word($this->session->worddata('word_id'));
        //$data['subword'] = $this->m_word->subword($this->session->worddata('word_id'));

        $this->render( "dictionary/approvement/content");
    }

    public function accept(){
      $id = $this->input->get('id');
      $data['status'] = 1;
      $data['verificator_id'] = $this->session->userdata('id');
      $this->update($id, $data);
      if($insert){
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Update data berhasil'));
      }else{
        $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, 'Terjadi Kesalahan');
      }
      redirect($this->current_page);
    }

    public function revision(){
      $id = $this->input->post('id');
      $data['revision'] = $this->input->post('revision');
      $data['status'] = 2;
      $data['verificator_id'] = $this->session->userdata('id');
      $this->update($id, $data);
      if($insert){
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Update data berhasil'));
      }else{
        $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, 'Terjadi Kesalahan');
      }
      redirect($this->current_page);
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

    

    private function attribute(){
      return [
      'id','language_id', 'name', 'type', 'translation', 'description','example', 'audio',  'status',  'revision'
      ];
    }

    private function label(){
      $name = $this->name;
      $label = [
        'Id Kata',
        'Bahasa',
        'Kata',
        'Tipe',
        'Arti',
        'Deskripsi',
        'Contoh',
        'Audio',
        'Status',
        'Revisi'
      ];
      $label_arr = array();
      foreach ($name as $key => $value) {
        $label_arr[$value] = $label[$key];
      }
      $label_arr['language_name'] = 'Bahasa';
       $label_arr['dialect_name'] = 'Dialek';
      $label_arr['type_name'] = 'Jenis';
      $label_arr['parent_name'] = 'Turunan Dari';
      return $label_arr;
    }

    private function data_type(){
      $name = $this->name;
      $type = [
        'number',
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

    private function validation_config(){
        $arr_con = [];
        $name = $this->name;
        unset($name[0],$name[7],$name[8],$name[9]);
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

    private function form_data($form_value=null){

        $select['type'] = [
          'nouns'=>'Nouns',
          'verbs'=>'Verbs',
          'adjectives'=>'Adjectives',
          'adverbs'=>'Adverbs',
        ];

        $select['language_id'] = $this->getLang();
        $name = $this->name;
        unset($name[0],$name[7],$name[8],$name[9]);
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

}
