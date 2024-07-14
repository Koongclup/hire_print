<?php
session_start();
// Check if the admin user is logged in
if (!isset($_SESSION['admin_user']) || empty($_SESSION['admin_user'])) {
  header("Location: ../index.php"); // Redirect to the login page if not logged in
  exit();
}
// Check the session timeout (3 hours)
if (isset($_SESSION['login_time']) && (time() - $_SESSION['login_time']) > 10800) {
  session_unset(); // Clear the session data
  session_destroy(); // Destroy the session
  header("Location: ../index.php"); // Redirect to the login page
  exit();
}
include '../inc/config/dbcon.php';
$query_pos = "SELECT * FROM tbl_position";
$pos = $conn->query($query_pos);
$query_lev = "SELECT * FROM tbl_level";
$level = $conn->query($query_lev);



?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
  <link href="https://cdn.datatables.net/fixedheader/3.4.0/css/fixedHeader.dataTables.css" rel="stylesheet">

  <script src="https://cdn.datatables.net/fixedheader/3.4.0/js/dataTables.fixedHeader.js"></script>
</head>
<style>
  img {

    border-radius: 4px;
    padding: 5px;
    width: 20;
    height: 60;
  }

  .p-2:hover {
   
    transform: scale(1.035);
    color: red;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
  }
</style>

<body>
  <?php include '../inc/layout/header_admin.php'; ?>
  <div class="vh-90 d-flex justify-content-center " style="min-height: calc(90vh - 50px);">
    <div class="container my-5">
      <?php include '../inc/layout/headbar.php'; ?>

      <div class="container mt-5">
        <div class="row" id="card-container">
          <!-- Cards will be dynamically added here -->
        </div>
        <nav aria-label="Page navigation">
          <ul class="pagination justify-content-center" id="pagination-container">
            <!-- Previous and Next buttons will be dynamically added here -->
          </ul>
        </nav>
      </div>
    </div>
  </div>
  <?php include '../inc/layout/footer.php'; ?>
</body>

<script>
  $(document).ready(function() {
    var cardContainer = $('#card-container');
    var paginationContainer = $('#pagination-container');
    var limit = 4;

    function fetchCards(page) {
      $.ajax({
        url: '../action/control_users.php?action=carduser&page=' + page,
        method: 'GET',
        dataType: 'json',
        success: function(data) {
          // Handle the data and create cards
          cardContainer.empty(); // Clear previous cards

          data.forEach(function(item) {
            var cardHtml = `
                    <div class="col-lg-3 col-md-6 col-12">
                      <div class="card p-2 my-3" >
                      <h2 class="d-flex justify-content-center"> <i class="bi bi-person-circle fa-4x"></i></h2>
                      <div class="card-body">
                        <h5 class="card-title d-flex justify-content-center">${item.fullname}</h5>
                        <p class="card-text"></p>
                      </div>
                      <p class="d-flex justify-content-center">${item.position}</p>
                      <div class="card-body d-flex flex justify-content-center">
                        <a href="#" class="card-link">More</a>
                        <a href="#" class="card-link">Another link</a>
                      </div>
                    </div>
                    </div>
                    `;

            cardContainer.append(cardHtml);
          });
        },
        error: function(error) {
          console.error('Error fetching data:', error);
        }
      });
    }

    function updatePagination(totalPages, currentPage) {
      paginationContainer.empty(); // Clear previous pagination links

      // Add "Previous" button
      var prevPage = currentPage - 1;
      var prevButton = `<li class="page-item ${prevPage <= 0 ? 'disabled' : ''}">
                            <a class="page-link" href="#" data-page="${prevPage}">Previous</a>
                          </li>`;
      paginationContainer.append(prevButton);

      // Add page links
      for (var i = 1; i <= totalPages; i++) {
        var pageLink = `<li class="page-item ${i === currentPage ? 'active' : ''}">
                              <a class="page-link" href="#" data-page="${i}">${i}</a>
                            </li>`;
        paginationContainer.append(pageLink);
      }

      // Add "Next" buttone
      var nextPage = currentPage + 1;
      var nextButton = `<li class="page-item ${nextPage > totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="#" data-page="${nextPage}">Next</a>
                          </li>`;
      paginationContainer.append(nextButton);

      // Add click event to pagination links
      paginationContainer.find('a').click(function(e) {
        e.preventDefault();
        var page = $(this).data('page');
        fetchCards(page);
      });
    }

    // Initial fetch for the first page
    fetchCards(1);

    // Fetch total number of rows for pagination
    $.ajax({
      url: '../action/control_users.php?action=total',
      method: 'GET',
      success: function(totalRows) {
        var totalPages = Math.ceil(totalRows / limit);
        updatePagination(totalPages, 1);
      },
      error: function(error) {
        console.error('Error fetching total rows:', error);
      }
    });
  });
</script>

</html>