<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FirstFrame.UserSetting.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registeration</title>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/datepicker.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="../style.css" rel="stylesheet" />
    <script>
        <!-- Function For Validate Passwords -->
    //$(function () {
    //    $('#btnSubmit').click(function () {
    //        var password = $('#txtnewpassword').val();
    //        var confirmPassword = $('#txtconfirmpassword').val();
    //        if (password != confirmPassword) {
    //            alert("Passwords do not match.");
    //            return false;
    //        }
    //        else { return true; }
    //    });
    //});

    $(function () {
        $('#txtnewpassword').blur(function () {
            if ($('#txtnewpassword').val().length < 6) {
                alert('Password Length must be more 6 digits!');
                $('#txtnewpassword').val("");
                $('#txtnewpassword').focus = true;
                return;
            }
        });
    });
    $(function () {
        $('#txtconfirmpassword').blur(function () {
            if ($('#txtconfirmpassword').val().length < 6) {
                alert('Password Length must be more 6 digits!');
                $('#txtconfirmpassword').val("");
                $('#txtconfirmpassword').focus = true;
                return;
            }
            if ($('#txtconfirmpassword').val() != $('#txtnewpassword').val()) {
                $('#txtnewpassword').val("");
                $('#txtconfirmpassword').val("");
                $('#txtnewpassword').focus = true;
                return;
            }
        });
    });
    //End Validate Passwords 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container maincolor">
            <nav class="navbar navbackground">
                <div class="container-fluid">
                    <div class="navbar-header col-md-4">
                        <asp:Image ID="ImageUser" class="userImage" runat="server" />
                    </div>
                    <div>
                        <div class="col-md-6">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="RoomService.aspx">HOME</a></li>
                                <li><a href="#">ABOUT</a></li>
                                <li><a href="#">CONTACT US</a></li>
                            </ul>
                        </div>
                        <div class="col-md-2">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Login.aspx">Login</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <ul class="nav nav-tabs tab">
                <li class="active"><a href="#">Change Password</a></li>
            </ul>
            <div class="tab-content tabcontent">
                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Current Password :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtOldpassword" Width="300px" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 colrow">
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label5" CssClass="control-label" runat="server" Text="New Password :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtnewpassword" Width="300px" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-md-6 colrow">
                    </div>
                </div>
                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Condirm New Password :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtconfirmpassword" Width="300px" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox><asp:Label ID="lblincortcurrentpassword" runat="server" Text=""></asp:Label>
                    </div>
                     <div class="col-md-6 colrow">
                    </div>
                </div>
                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:Button ID="btnSubmit" BackColor="Blue" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                     <div class="col-md-6 colrow">
                    </div>
                </div>
            </div>
            <div class="panel-footer">
            </div>
        </div>
    </form>
</body>
</html>

