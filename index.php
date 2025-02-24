<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="fr" class="" style="height: auto;">
<?php require_once('inc/header.php') ?>
<body class="layout-top-nav">
  <div class="wrapper">
   <?php require_once('inc/topBarNav.php') ?>
   <?php $page = isset($_GET['page']) ? $_GET['page'] : 'home';  ?>
    <div class="content-wrapper pt-3" style="min-height: 567.854px;">
      <section class="content text-dark">
        <div class="container">
          <?php 
            if(!file_exists($page.".php") && !is_dir($page)){
                include '404.html';
            }else{
              if(is_dir($page))
                include $page.'/index.php';
              else
                include $page.'.php';
            }
          ?>
        </div>
      </section>
<div class="modal fade" id="uni_modal" role='dialog'>
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title"></h5>
    </div>
    <div class="modal-body">
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Enregistrer</button>
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
    </div>
    </div>
  </div>
</div>
<div class="modal fade" id="confirm_modal" role='dialog' data-backdrop='static'>
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title">Confirmation</h5>
    </div>
    <div class="modal-body">
      <div id="delete_content"></div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-primary" id='confirm' onclick="">Continuer</button>
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
    </div>
    </div>
  </div>
</div>
<div class="modal fade" id="uni_modal_right" role='dialog'>
  <div class="modal-dialog modal-full-height  modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title"></h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Fermer">
        <span class="fa fa-arrow-right"></span>
      </button>
    </div>
    <div class="modal-body">
    </div>
    </div>
  </div>
</div>
<div class="modal fade" id="viewer_modal" role='dialog'>
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
            <button type="button" class="btn-close" data-dismiss="modal"><span class="fa fa-times"></span></button>
            <img src="" alt="">
    </div>
  </div>
</div>
    </div>
    <?php require 'inc/footer.php'?>
</body>
</html>
