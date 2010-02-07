var Upload = {

	// some elements ids
	form: null,
	photo: null,
	loading: null,
	image: null,
	error: null,

	// 0: no photo, 1: uploading, 2: uploaded, 3: upload failed
	status: 0, 

	// initialize
	init: function(elems) {
		var self = this;
		$H(elems).each(function(it){
			self[it.key] = $(it.value);
		});
		this.photo.observe('change', function(){
			self.upload();
		});
	},

	// start to upload file
	upload: function() {
		this.status = 1;
		this.loading.show();
		this.error.update().hide();
		this.form.submit();
	},

	// status: 2 or 3
	done: function(image, status, error) {
		this.status = status;
		this.loading.hide();

		// upload failed
		if (this.status == 3) {
			this.image.update();
			this.error.update(error).show();
			return;
		}

		// upload success
		this.image.update('<image src="' + image + '" width="200" />');
	}
}
