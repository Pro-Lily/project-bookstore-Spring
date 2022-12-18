var myEditor;

ClassicEditor 
    .create( document.querySelector('#book_contents'), {
		ckfinder: {
	        uploadUrl: "/triple/shop/upload"
	    }

	}) 
    .then( editor => { 
        console.log( editor );
		myEditor = editor;
    } ) 
    .catch( err => { 
        console.error( err.stack ); 
    } );
 
