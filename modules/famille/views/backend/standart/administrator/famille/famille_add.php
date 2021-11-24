
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>
<script type="text/javascript">
    function domo(){
     
       // Binding keys
       $('*').bind('keydown', 'Ctrl+s', function assets() {
          $('#btn_save').trigger('click');
           return false;
       });
    
       $('*').bind('keydown', 'Ctrl+x', function assets() {
          $('#btn_cancel').trigger('click');
           return false;
       });
    
      $('*').bind('keydown', 'Ctrl+d', function assets() {
          $('.btn_save_back').trigger('click');
           return false;
       });
        
    }
    
    jQuery(document).ready(domo);
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Famille        <small><?= cclang('new', ['Famille']); ?> </small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/famille'); ?>">Famille</a></li>
        <li class="active"><?= cclang('new'); ?></li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="row" >
        <div class="col-md-12">
            <div class="box box-warning">
                <div class="box-body ">
                    <!-- Widget: user widget style 1 -->
                    <div class="box box-widget widget-user-2">
                        <!-- Add the bg color to the header using any of the bg-* classes -->
                        <div class="widget-user-header ">
                            <div class="widget-user-image">
                                <img class="img-circle" src="<?= BASE_ASSET; ?>/img/add2.png" alt="User Avatar">
                            </div>
                            <!-- /.widget-user-image -->
                            <h3 class="widget-user-username">Famille</h3>
                            <h5 class="widget-user-desc"><?= cclang('new', ['Famille']); ?></h5>
                            <hr>
                        </div>
                        <?= form_open('', [
                            'name'    => 'form_famille', 
                            'class'   => 'form-horizontal form-step', 
                            'id'      => 'form_famille', 
                            'enctype' => 'multipart/form-data', 
                            'method'  => 'POST'
                            ]); ?>
                        <?php
                        $user_groups = $this->model_group->get_user_group_ids();
                        ?>
                         
                                                                        <div class="form-group ">
                            <label for="nomFamille" class="col-sm-2 control-label">NomFamille 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="nomFamille" id="nomFamille" placeholder="NomFamille" value="<?= set_value('nomFamille'); ?>">
                                <small class="info help-block">
                                <b>Input NomFamille</b> Max Length : 255.</small>
                            </div>
                        </div>
                        

                                                 
                                                                        <div class="form-group ">
                            <label for="nombreEnfant" class="col-sm-2 control-label">NombreEnfant 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="nombreEnfant" id="nombreEnfant" placeholder="NombreEnfant" value="<?= set_value('nombreEnfant'); ?>">
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                        

                                                 
                                                                        <div class="form-group ">
                            <label for="descriptionFamille" class="col-sm-2 control-label">DescriptionFamille 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="descriptionFamille" name="descriptionFamille" rows="5" cols="80"><?= set_value('DescriptionFamille'); ?></textarea>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                        

                                                 
                                                                        <div class="form-group ">
                            <label for="dateMarriage" class="col-sm-2 control-label">DateMarriage 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-6">
                            <div class="input-group date col-sm-8">
                              <input type="text" class="form-control pull-right datepicker" name="dateMarriage"  placeholder="DateMarriage" id="dateMarriage">
                            </div>
                            <small class="info help-block">
                            </small>
                            </div>
                        </div>
                        

                                                 
                                                                        <div class="form-group ">
                            <label for="adresse" class="col-sm-2 control-label">Adresse 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="adresse" name="adresse" rows="5" cols="80"><?= set_value('Adresse'); ?></textarea>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                        

                                                
                        
                                                <div class="message"></div>
                                                <div class="row-fluid col-md-7 container-button-bottom">
                           <button class="btn btn-flat btn-primary btn_save btn_action" id="btn_save" data-stype='stay' title="<?= cclang('save_button'); ?> (Ctrl+s)">
                            <i class="fa fa-save" ></i> <?= cclang('save_button'); ?>
                            </button>
                            <a class="btn btn-flat btn-info btn_save btn_action btn_save_back" id="btn_save" data-stype='back' title="<?= cclang('save_and_go_the_list_button'); ?> (Ctrl+d)">
                            <i class="ion ion-ios-list-outline" ></i> <?= cclang('save_and_go_the_list_button'); ?>
                            </a>
                            <a class="btn btn-flat btn-default btn_action" id="btn_cancel" title="<?= cclang('cancel_button'); ?> (Ctrl+x)">
                            <i class="fa fa-undo" ></i> <?= cclang('cancel_button'); ?>
                            </a>
                            <span class="loading loading-hide">
                            <img src="<?= BASE_ASSET; ?>/img/loading-spin-primary.svg"> 
                            <i><?= cclang('loading_saving_data'); ?></i>
                            </span>
                        </div>
                                                 <?= form_close(); ?>
                    </div>
                </div>
                <!--/box body -->
            </div>
            <!--/box -->
        </div>
    </div>
</section>
<!-- /.content -->
<script src="<?= BASE_ASSET; ?>ckeditor/ckeditor.js"></script>
<!-- Page script -->
<script>
    $(document).ready(function(){

                   CKEDITOR.replace('descriptionFamille'); 
      var descriptionFamille = CKEDITOR.instances.descriptionFamille;
            CKEDITOR.replace('adresse'); 
      var adresse = CKEDITOR.instances.adresse;
                   
      $('#btn_cancel').click(function(){
        swal({
            title: "<?= cclang('are_you_sure'); ?>",
            text: "<?= cclang('data_to_be_deleted_can_not_be_restored'); ?>",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes!",
            cancelButtonText: "No!",
            closeOnConfirm: true,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
              window.location.href = BASE_URL + 'administrator/famille';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
        $('#descriptionFamille').val(descriptionFamille.getData());
                $('#adresse').val(adresse.getData());
                    
        var form_famille = $('#form_famille');
        var data_post = form_famille.serializeArray();
        var save_type = $(this).attr('data-stype');

        data_post.push({name: 'save_type', value: save_type});
    
        $('.loading').show();
    
        $.ajax({
          url: BASE_URL + '/administrator/famille/add_save',
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          $('form').find('.form-group').removeClass('has-error');
          $('.steps li').removeClass('error');
          $('form').find('.error-input').remove();
          if(res.success) {
            
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
    
            $('.message').printMessage({message : res.message});
            $('.message').fadeIn();
            resetForm();
            $('.chosen option').prop('selected', false).trigger('chosen:updated');
            descriptionFamille.setData('');
            adresse.setData('');
                
          } else {
            if (res.errors) {
                
                $.each(res.errors, function(index, val) {
                    $('form #'+index).parents('.form-group').addClass('has-error');
                    $('form #'+index).parents('.form-group').find('small').prepend(`
                      <div class="error-input">`+val+`</div>
                      `);
                });
                $('.steps li').removeClass('error');
                $('.content section').each(function(index, el) {
                    if ($(this).find('.has-error').length) {
                        $('.steps li:eq('+index+')').addClass('error').find('a').trigger('click');
                    }
                });
            }
            $('.message').printMessage({message : res.message, type : 'warning'});
          }
    
        })
        .fail(function() {
          $('.message').printMessage({message : 'Error save data', type : 'warning'});
        })
        .always(function() {
          $('.loading').hide();
          $('html, body').animate({ scrollTop: $(document).height() }, 2000);
        });
    
        return false;
      }); /*end btn save*/
      
       
 
       

      
    
    
    }); /*end doc ready*/
</script>