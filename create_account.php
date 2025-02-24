<?php require_once('config.php') ?>
<form action="" id="manage-user">	
    <input type="hidden" name="id" value="">
    <div class="form-group">
        <label for="firstname">Prénom</label>
        <input type="text" name="firstname" id="firstname" class="form-control" value="" required>
    </div>
    <div class="form-group">
        <label for="lastname">Nom</label>
        <input type="text" name="lastname" id="lastname" class="form-control" value="" required>
    </div>
    <div class="form-group">
        <label for="username">Nom d'utilisateur</label>
        <input type="text" name="username" id="username" class="form-control" value="" required  autocomplete="off">
    </div>
    <div class="form-group">
        <label for="password">Mot de passe</label>
        <input type="password" name="password" id="password" class="form-control" value="" autocomplete="off">
        <small><i>Laissez ce champ vide si vous ne souhaitez pas changer le mot de passe.</i></small>
    </div>
    <div class="form-group">
        <label for="" class="control-label">Avatar</label>
        <div class="custom-file">
            <input type="file" class="custom-file-input rounded-circle" id="customFile" name="img" onchange="displayImg(this,$(this))">
            <label class="custom-file-label" for="customFile">Choisir un fichier</label>
        </div>
    </div>
    <div class="form-group d-flex justify-content-center">
        <img src="<?php echo validate_image(isset($meta['avatar']) ? $meta['avatar'] :'') ?>" alt="" id="cimg" class="img-fluid img-thumbnail">
    </div>
</form>
<style>
	img#cimg{
		height: 15vh;
		width: 15vh;
		object-fit: cover;
		border-radius: 100% 100%;
	}
</style>
<script>
	function displayImg(input,_this) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#cimg').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#manage-user').submit(function(e){
		e.preventDefault();
		start_loader()
		$.ajax({
			url:_base_url_+'classes/Users.php?f=save',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp == 1){
					location.reload()
				}else{
					$('#msg').html('<div class="alert alert-danger">Le nom d\'utilisateur existe déjà</div>')
					end_loader()
				}
			}
		})
	})
</script>
