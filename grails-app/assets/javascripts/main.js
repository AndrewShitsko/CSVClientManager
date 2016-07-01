$("#inputCsvFile").on("change", function() {
    if ($("#inputCsvFile").val())
        $("#inputImport").get(0).disabled = false;
    else
        $("#inputImport").get(0).disabled = true;
});

$("#buttonSearch").on("click", function() {
    if ($("#inputSearch").val())
        return true;
    else
        return false;
});

$("#importForm").submit(function(e) {
    e.preventDefault();
    var file = $("#inputCsvFile").get(0).files[0];
    var form = new FormData();
    form.append("file", file);
    $.ajax({
        url: "/client/importFile",
        type: "POST",
        data: form,
        mimeType: "multipart/form-data",
        contentType: false,
        cache: false,
        processData: false
    }).done(function (data) {
        var importedCount = $.parseJSON(data)["importedCount"];

        // send message
        var message = "<div class='message' role='status'>Imported records: " + importedCount + ". Click 'Clients' to see result</div>";
        $(".message").remove();
        $("#import-client").prepend(message);

        // reset input file
        $("#inputCsvFile").val("").change();
    }).fail(function(xhr, textStatus) {
        alert(textStatus);
    });
});
