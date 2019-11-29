<section class="content">
	<div class="container-fluid">
		<div class="block-header">
			<h2><?php echo $block_header ?></h2>
		</div>
        <div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                  <div class="row clearfix" style="margin-bottom:-30px">
                    <div class="col-md-6">
                      <h2>
                          <?php echo strtoupper($header)?>
                          <small><?php echo $sub_header ?></small>
                      </h2>
                    </div>
                    <!-- search form -->
                    <div class="col-md-6">
                      <div class="row clearfix">
                        <div class="col-md-2">

                            <div class="row clearfix">
                              <select class="form-control show-tick" id="limit" name="" onchange="changeLimit()">
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                              </select>
                            </div>

                        </div>
                        <div class="col-md-10">
                          <form method="get" action="<?php echo site_url($current_page)?>">
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12" style="margin-bottom:0px!important">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" name="key" required class="form-control" placeholder="Pencarian" value="<?php echo ($key) ? $key : '' ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-4 col-sm-12 col-xs-12 text-right">
                                  <div class="btn-group">
                                    <button type="submit" class="btn btn-warning btn-md m-l-15 waves-effect"><i class="material-icons">search</i></button>
                                    <a href="<?php echo site_url($current_page); ?>" type="button"  class="btn btn-warning btn-md m-l-15 waves-effect"><i class="material-icons">refresh</i></a>
                                  </div>
                                </div>
                            </div>
                          </form>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>

            <div class="body table-responsive">
								<?php echo $alert ?>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>No</th>
														<?php foreach ($table_header as $kh => $vh): ?>
															<th><?php echo $vh ?></th>
														<?php endforeach; ?>
                            <th>Terima</th>
                            <th>Revisi</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                          if (!empty($for_table)): //if array data in not empty, show table
                            $no=$number;
                            foreach ($for_table as $key => $value) :
                                $no++;
                            ?>
                                <tr>
                                  <th scope="row"><?php echo $no?></th>
																	<?php foreach ($table_header as $kh => $vh): ?>
																		<?php if($kh=='status'){
																			switch ($value->{$kh}) {
																				case '0':
																					$b = '<span class="badge bg-orange"> Checking </span>';
																					break;
																				case '1':
																					$b = '<span class="badge bg-green"> Active </span>';
																					break;
																				case '2':
																					$b = '<span class="badge bg-red"> Revision </span>';
																					break;
																			}
																			$value->{$kh} = $b;
																		}?>
																		<?php if($kh=='name'){ ?>
                                          <td>
                                           <b style="font-size:1.2em"> <?php echo $value->{$kh}?> </b>
                                           <p style="font-size:0.9em;color:#999"><?php echo $value->type_name?></p>
                                           <p><?php echo "Arti: <b>";echo ucfirst($value->translation).'</b>'?></p>
                                           <p><?php if($value->parent_name!=null) echo "Turunun dari: <b>";echo ucfirst($value->parent_name).'</b>'?></p>
                                           <p><?php if($value->description!='-') echo ucfirst($value->description)?></p>
                                           <p><i><?php if($value->example!='-')echo str_replace("--"," <b>".$value->name."</b> ",$value->example)?></i></p>
                                          </td>
                                      <?php }elseif($kh=='language_name'){ ?>
                                          <td>
                                            <b style="font-size:1.2em"> <?php echo $value->{$kh}?> </b>
                                      <?php if($value->dialect_name!=null){?><p style="font-size:0.9em;color:#999">Dialek: <?php echo $value->dialect_name?></p><?php } ?>
                                          </td>
                                      <?php }else{?>
                                          <td><?php echo $value->{$kh}?></td>
                                      <?php }  ?>
																	<?php endforeach; ?>
                                    <td class="text-center">
                                      <a href="<?php echo site_url($current_page.'/accept?id='.$value->id)?>">
                                        <button class="btn btn-primary waves-effect" type="button">
                                          <i class="material-icons">assignment_turned_in</i>
                                        </button>
                                      </a>
                                    </td>
                                    <td class="text-center">
                                      <button class="btn btn-danger waves-effect" type="button" data-toggle="modal" data-target="#defaultModal" onclick="revision(<?php echo $value->id?>, '<?php echo $value->name?>')">
                                        <i class="material-icons">assignment_late</i>
                                      </button>
                                  </td>
                                </tr>
                        <?php
                            endforeach;
                          else:
                        ?>
                        <h3>Data Tidak Ditemukan</h3>
                      <?php endif; ?>
                    </tbody>
                </table>
                <div class="text-center">
                    <?php if (isset($links)) echo $links?>
                </div>
            </div>
        </div>
    </div>
</div>
	</div>
</section>
<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="defaultModalLabel">Revisi <span id='wordName'></span></h4>
            </div>
             <?php echo form_open($current_page.'/revision',"class='form-group'")?>
            <div class="modal-body">
              
                  <input type="hidden" id="wordId" name="id">
                  <div class="form-line">
                      <textarea rows="6" name="revision" class="form-control no-resize" placeholder="Alasan Revisi"></textarea>
                  </div>
               
            </div>
            <div class="modal-footer">
                <button type="input" class="btn btn-link waves-effect">SAVE CHANGES</button>
                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
            </div>
            <?php echo form_close()?>
        </div>
    </div>
</div>
<script>  
  function revision(id, name){
    let tittle = document.getElementById('wordName');
    let input = document.getElementById('wordId');
    tittle.innerHTML = name;
    input.value = id;
    //console.log(id);
  }
</script>