
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>
<script type="text/javascript">
//This page is a result of an autogenerated content made by running test.html with firefox.
function domo(){
 
   // Binding keys
   $('*').bind('keydown', 'Ctrl+e', function assets() {
      $('#btn_edit').trigger('click');
       return false;
   });

   $('*').bind('keydown', 'Ctrl+x', function assets() {
      $('#btn_back').trigger('click');
       return false;
   });
    
}


jQuery(document).ready(domo);
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Gallerie      <small><?= cclang('detail', ['Gallerie']); ?> </small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/gallerie'); ?>">Gallerie</a></li>
      <li class="active"><?= cclang('detail'); ?></li>
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
                        <img class="img-circle" src="<?= BASE_ASSET; ?>/img/view.png" alt="User Avatar">
                     </div>
                     <!-- /.widget-user-image -->
                     <h3 class="widget-user-username">Gallerie</h3>
                     <h5 class="widget-user-desc">Detail Gallerie</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal form-step" name="form_gallerie" id="form_gallerie" >
                  
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">IdGallerie </label>

                        <div class="col-sm-8">
                           <?= _ent($gallerie->idGallerie); ?>
                        </div>
                    </div>
                                        
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> Photos </label>
                        <div class="col-sm-8">
                             <?php if (is_image($gallerie->photos)): ?>
                              <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/gallerie/' . $gallerie->photos; ?>">
                                <img src="<?= BASE_URL . 'uploads/gallerie/' . $gallerie->photos; ?>" class="image-responsive" alt="image gallerie" title="photos gallerie" width="40px">
                              </a>
                              <?php else: ?>
                              <label>
                                <a href="<?= BASE_URL . 'administrator/file/download/gallerie/' . $gallerie->photos; ?>">
                                 <img src="<?= get_icon_file($gallerie->photos); ?>" class="image-responsive" alt="image gallerie" title="photos <?= $gallerie->photos; ?>" width="40px"> 
                               <?= $gallerie->photos ?>
                               </a>
                               </label>
                              <?php endif; ?>
                        </div>
                    </div>
                                      
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">DatePublication </label>

                        <div class="col-sm-8">
                           <?= _ent($gallerie->datePublication); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>


                     
                         
                    <div class="view-nav">
                        <?php is_allowed('gallerie_update', function() use ($gallerie){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit gallerie (Ctrl+e)" href="<?= site_url('administrator/gallerie/edit/'.$gallerie->idGallerie); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Gallerie']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/gallerie/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Gallerie']); ?></a>
                     </div>
                    
                  </div>
               </div>
            </div>
            <!--/box body -->
         </div>
         <!--/box -->

      </div>
   </div>
</section>
<!-- /.content -->
<script>
$(document).ready(function(){

   });
</script>