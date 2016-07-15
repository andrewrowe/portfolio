﻿var uri = '/api/post/getpendingposts';


$(document)
    .ready(function () {
        loadPosts();
        
        //get click from dynamically created links
        $("#pendingPosts").on("click", ".approveButton", function (event) {

            //var approvePostPath = '/api/post/' + id;
            var id = ($(this).attr("data-value"));
            //alert("approve post id: " + id);


            $.ajax({
                url: '/api/post/approvepost/' + id,
                type: 'PUT',
                dataType: 'json',
                data: id,
                success: function (data, status, xhr) {
                    $("div.alert-success").html("<strong>Success:</strong> Post was approved");
                    $("div.alert-success").fadeIn(300).delay(2500).fadeOut(500);
                    loadPosts();
                },
                error: function(xhr, status, err) {
                    $("div.alert-danger").html("<strong>Failure:</strong> There was an issue with the server: " + err);
                    $("div.alert-danger").fadeIn(300);
                }

            });
           
            event.preventDefault();
        });


        $("#pendingPosts").on("click", ".notApprovedButton", function (event) {
            $('#addRemarkModal').modal('show');
            $('#postId').val($(this).attr("data-value"));
            event.preventDefault();
        });

        $("html").on("click", "#addCategoryButton", function (event) {
            $('#addCategoryModal').modal('show');
            event.preventDefault();
        });

        $("html").on("click", "#staticPageButton", function (event) {
            $('#staticPageModal').modal('show');
            event.preventDefault();
            loadStaticPages();
        });

        $("#pendingPosts").on("click", ".postLink", function (event) {
            var id = ($(this).attr("data-value"));
            var getPostUri = '/api/post/GetOnlinePost/';

            $.getJSON(getPostUri + id)
                .done(function(data) {
                    console.log(data);

                    $('#viewPostBody').empty();
                    $('#ViewPostHeading').empty();

                    $('#ViewPostHeading').append((data.Title));
                    $('#viewPostBody').append((data.PostContent));
                    $('#viewPostBody').append(("<br>"));
                    $('#viewPostBody').append(("Categories: "));
                    $.each(data.Categories, function (i, item) {
                        $('#viewPostBody').append((item.CategoryName + " ")); 
                    });
                    $('#viewPostBody').append(("<br>"));
                    $('#viewPostBody').append(("Tags: "));
                    $.each(data.Tags, function (i, item) {
                        $('#viewPostBody').append((item.TagName + " "));
                    });
                   
                
                $('#viewPostModal').modal('show');
                

                });

        

        });

            event.preventDefault();
        });

        $("#btnSaveCategory")
            .click(function() {
                
                if ($("#AddCategoryForm").valid()) {
                    event.preventDefault();
                    var id = $("#category").val();

                    $.ajax({
                        url: '/api/post/addcategory/' + id,
                        type: 'PUT',
                        dataType: 'json',
                        data: id,
                        success: function (data, status, xhr) {
                            $("div.alert-success").html("<strong>Success:</strong> Category was added");
                            $("div.alert-success").fadeIn(300).delay(2500).fadeOut(500);
                            $('#addCategoryModal').modal('hide');
                            
                        },
                        error: function (xhr, status, err) {
                            $("div.alert-danger").html("<strong>Failure:</strong> There was an issue with the server: " + err);
                            $("div.alert-danger").fadeIn(300);
                            $('#addCategoryModal').modal('hide');
                        }

                    });

                }
            });


        $("#btnSaveRemark")
            .click(function () {
                if ($("#remarkForm").valid()) {
                    event.preventDefault();

                    var AddRemarkVM = {};

                    AddRemarkVM.Id = $('#postId').val();
                    AddRemarkVM.Remark = $('#remark').val();

                    $.ajax({
                        url: '/api/post/addremark/',
                        type: 'PUT',
                        dataType: 'json',
                        data: AddRemarkVM,
                        success: function (data, status, xhr) {
                            $("div.alert-success").html("<strong>Success:</strong> Post was set to draft status");
                            $("div.alert-success").fadeIn(300).delay(2500).fadeOut(500);
                            $('#addRemarkModal').modal('hide');
                            loadPosts();
                        },
                        error: function (xhr, status, err) {
                            $("div.alert-danger").html("<strong>Failure:</strong> There was an issue with the server: " + err);
                            $("div.alert-danger").fadeIn(300);
                            $('#addRemarkModal').modal('hide');
                        }

                    });



                    console.log(AddRemarkVM);
                }
            });



function loadPosts() {
    $.getJSON(uri)
        .done(function (data) {
            $('#pendingPosts tbody tr').remove();
            $.each(data,
                function (index, post) {
                    $(createRow(post)).appendTo($('#pendingPosts tbody'));
                });
           
            if (data.length > 5) {
                $('#pendingPosts tbody tr:gt(4)').hide();
                $("#showAllButton").show();
            }
            
        });
};

function loadStaticPages() {
    $.getJSON("../api/admin/GetPages")
        .done(function (data) {
            $('#staticPageTable tr').remove();
            $.each(data,
                function (index, page) {
                    $(createRowPage(page)).appendTo($('#staticPageTable'));
                });
        });
};

function createRowPage(page) {

    return '<tr><td>' +
        page.Title +
        '</td><td>' +
       '<a class="editPage" href="#" data-value="' + page.ID + '" ><i class="glyphicon glyphicon-pencil"></i></a> ' +
       '<a class="deletePage" href="#" data-value="' + page.ID + '"><i class="glyphicon glyphicon-remove red"></i></a>' +
        '</td></tr>';
};

$("#staticPageTable").on("click", ".deletePage", function (event) {

    var id = ($(this).attr("data-value"));


    $.ajax({
        url: '/api/admin/pagedelete/' + id,
        type: 'DELETE',
        dataType: 'json',
        data: id,
        success: function (data, status, xhr) {
            loadStaticPages();
        },
        error: function (xhr, status, err) {
            $("div.alert-danger").html("<strong>Failure:</strong> There was an issue with the server: " + err);
            $("div.alert-danger").fadeIn(300);
        }

    });

    event.preventDefault();
});

$("#staticPageTable").on("click", ".editPage", function (event) {
    event.preventDefault();
    var id = ($(this).attr("data-value"));

    window.location.href = "../admin/editstatic/" + id;
});

function createRow(post) {

    var status;
    if (post.StatusString == "PendingUpdate") {
        status = "Pending - Updated Post";
    } else if (post.StatusString == "PendingNew") {
        status = "Pending - New Post";
    } else {
        status = post.StatusString;
    }


    return '<tr><td>' +
        status +
        '</td><td>' +
        '<a href="#" data-value="'+ post.Id +'" class="postLink">' + post.Title + '</a>' +
        '</td><td>' +
       '<a class="notApprovedButton" href="#" data-value="' + post.Id + '" ><i class="glyphicon glyphicon-repeat red"></i></a> ' +
       '<a class="approveButton" href="#" data-value="' + post.Id + '"><i class="glyphicon glyphicon-ok green"></i></a>' +
        '</td></tr>';
};

$("#showAllButton")
    .click(function() {
        $('#pendingPosts tbody tr:gt(1)').show();
        $(this).hide();
    });

    $("#createPage")
    .click(function() {
        window.location.href = "/admin/createstatic";
    });