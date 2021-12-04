

$(document).ready(function (){
    // When the user clicks the button, open the modal
    $('#myBtn').click(function (e){
        e.preventDefault();
        $('.testmodal').css('display','flex');
    });
    // When the user clicks on <span> (x), close the modal
    $('.close').click(function (){
        $('.testmodal').fadeOut();
    })
    // When the user clicks anywhere outside of the modal, close it
    $('.bg-modal').click(function (){
        $('.testmodal').fadeOut();
    })
})

// Userprofile

$(document).ready(function() {


    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }


    $(".file-upload").on('change', function(){
        readURL(this);
    });
});

$(function() {

    // We can attach the `fileselect` event to all file inputs on the page
    $(document).on('change', ':file', function() {
        var input = $(this),
            numFiles = input.get(0).files ? input.get(0).files.length : 1,
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
    });

    // We can watch for our custom `fileselect` event like this
    $(document).ready( function() {
        $(':file').on('fileselect', function(event, numFiles, label) {

            var input = $(this).parents('.input-group').find(':text'),
                log = numFiles > 1 ? numFiles + ' files selected' : label;

            if( input.length ) {
                input.val(log);
            } else {
                if( log ) alert(log);
            }

        });
    });
});

// Function for Specilization Input
$( function() {
    var availableTags = [
        "ActionScript",
        "AppleScript",
        "Asp",
        "BASIC",
        "C",
        "C++",
        "Clojure",
        "COBOL",
        "ColdFusion",
        "Erlang",
        "Fortran",
        "Groovy",
        "Haskell",
        "Java",
        "JavaScript",
        "Lisp",
        "Perl",
        "PHP",
        "Python",
        "Ruby",
        "Scala",
        "Scheme"
    ];
    $( "#tags" ).autocomplete({
        source: availableTags
    });
} );

// Function for Designation Input
$( function() {
    var availableTags = [
        "Analyst L1",
        "Analyst L2",
        "Senior Analyst",
        "UI Developer L1",
        "UI Developer L2",
        "Senior UI Developer",
        "Graphics Designer L1",
        "Graphics Designer L2",
        "Senior Graphics Designer",
    ];
    $( "#designation" ).autocomplete({
        source: availableTags
    });
} );

$('form').submit(function(){
    $('.thanks').show();
    $('.thanks').delay(2000).fadeOut();
    window.setInterval(function() {
        window.location.reload();
        $('form input#name').focus();
    }, 2500);
    event.preventDefault(); // Here triggering stops
});

// Autocomplete for Specialization
$( "#tags" ).autocomplete({
    //source: tags,
    //To select only from the autocomplete
    change: function (event, ui) {
        if (ui.item == null || ui.item == undefined) {
            $(this).val("");
            $(this).attr("disabled", false);
        }
    }
});

// Autocomplete for Designation
$( "#designation" ).autocomplete({
   //source:tags,
    //To select only from the autocomplete
    change: function (event, ui) {
        if (ui.item == null || ui.item == undefined) {
            $(this).val("");
            $(this).attr("disabled", false);
        }
    }
});
$('.datepicker').datepicker({
    minDate: 0,
    maxDate: 30,
    dateFormat: "yy-mm-dd"
});
