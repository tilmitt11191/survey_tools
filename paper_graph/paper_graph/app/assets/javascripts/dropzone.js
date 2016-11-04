Dropzone.autoDiscover = false;

var headlineDropzone = new Dropzone("#upload-dropzone", {

  url: "/api/uploaded_papers",

  params: {
    paper_id: <%= paper_id %>,
  },

  maxFilesize: 5, // in MB

  addRemoveLinks: true,

  parallelUploads: 2,

  acceptedFiles:'.pdf', // type of files

  init: function(){

    this.on('addedfile', function(file) {

      // Called when a file is added to the list.

    });

    this.on('sending', function(file, xhr, formData) {

      // Called just before each file is sent.

    });

    //json is picture object whitch server return
    this.on('success', function(file, json) {
      // Called when file uploaded successfully.
      console.log(json);
      $(file.previewTemplate).find('.dz-remove').attr('id', json.id);
    });

  },

 removedfile: function(file){
     // grap the id of the uploaded file we set earlier
     var id = $(file.previewTemplate).find('.dz-remove').attr('id');
     var delete_file = file
     // make a DELETE ajax request to delete the file
     $.ajax({
         type: 'DELETE',
         url: '/api/' + id,
         success: function(res){
           $(delete_file.previewTemplate).fadeOut();
         }
     });
 }

});


  namespace :api, { format: 'json' } do
   post "paper_upload"
   resources :pictures
  end