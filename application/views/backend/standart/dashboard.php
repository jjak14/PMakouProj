<style type="text/css">
    .widget-user-header {
        padding-left: 20px !important;
    }
</style>

<link rel="stylesheet" href="<?= BASE_ASSET; ?>admin-lte/plugins/morris/morris.css">

<section class="content-header">
    <h1>
        <?= cclang('dashboard') ?>
        <small>

            <?= cclang('control_panel') ?>
        </small>
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="#">
                <i class="fa fa-dashboard">
                </i>
                <?= cclang('home') ?>
            </a>
        </li>
        <li class="active">
            <?= cclang('dashboard') ?>
        </li>
    </ol>
</section>

<section class="content" style="background-image: url('/asset/img/bg.jpg'); background-size:cover; background-position:center; background-repeat:no-repeat;">
    <div class="row">
        <?php cicool()->eventListen('dashboard_content_top'); ?>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box button" onclick="goUrl('page/arbre-genealogique')">
                <span class="info-box-icon bg-aqua">
                    <i class="ion ion-ios-gear">
                    </i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">
                        <?php //cclang('crud_builder') 
                        ?>
                        Arbre Genealogique
                    </span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box button" onclick="goUrl('page/familles')">
                <span class="info-box-icon bg-yellow">
                    <i class="ion ion-social-chrome">
                    </i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">
                        <?php //cclang('api_builder') 
                        ?>
                        Liste des familles
                    </span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box button" onclick="goUrl('administrator/page')">
                <span class="info-box-icon bg-aqua">
                    <i class="ion ion-ios-paper">
                    </i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">
                        <?php //cclang('page_builder') 
                        ?>
                        Liste des Evenements
                    </span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box button" onclick="goUrl('page/a-propos-de-nous')">
                <span class="info-box-icon bg-yellow">
                    <i class="ion ion-android-list">
                    </i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">
                        <?php //cclang('form_builder') 
                        ?>
                        A Propos de Nous
                    </span>
                </div>
            </div>
        </div>
        <img src="/asset/img/logo.png" width="330" hight="330" style="margin-left:35%;">


    </div>

    <!-- /.row -->
    <?php cicool()->eventListen('dashboard_content_bottom'); ?>

</section>
<!-- /.content -->