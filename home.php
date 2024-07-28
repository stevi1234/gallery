<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="container mt-5">
        <div class="d-sm-flex align-items-center justify-content-between">
            <div class="p-1 mt-5">
                <h1>Gardez<span class="text-warning"> vos souvenires </span>avec <?php echo $_settings->info('name') ?></h1>
                <p class="lead my-4">
                    Votre galerie en ligne ultime.<br>Explorez et partagez les moments inoubliables de votre vie quotidienne
                </p>
                <a href="register.php" class="btn btn-primary btn-lg">S'inscrire et poster</a>
            </div>
            <video class="img-fluid w-50 d-none d-sm-block" width="auto" height="100%" autoplay loop>
        			<source src="assets/media/Overview.mp4" type="video/mp4">
        	</video>
        </div>
    </div>