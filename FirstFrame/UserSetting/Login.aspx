<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FirstFrame.UserSetting.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login</title>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtEmail').focus(function () {
                $("label[for='lblemail']").text("");
                $("label[for='lblpassword']").text("");
            });
        });



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
                                <li><a href="Registration.aspx">Register</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <ul class="nav nav-tabs tab">
                <li class="active"><a href="#">Login</a></li>
            </ul>

            <div class="tab-content tabcontent">

                <div class="row rowtabcontent">
                    <div class="col-md-4 colrow lablealign">
                        <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Email :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" Width="300px" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:Label ID="lblemail" CssClass="control-label" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-4 colrow lablealign">
                        <asp:Label ID="Label5" CssClass="control-label" runat="server" Text="Password :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtpassword" Width="300px" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        <a href="ResetPassword.aspx">Forget Password?</a>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:Label ID="lblpassword" CssClass="control-label" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:Button ID="btnLogin" BackColor="Blue" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                </div>

                <div class="panel-footer">
                </div>
            </div>

        </div>
    </form>
</body>
</html>
