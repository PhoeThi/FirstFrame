<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="FirstFrame.UserSetting.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registeration</title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="../Scripts/DataTables/dataTables.responsive.js"></script>    
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="../Content/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../Content/DataTables/css/responsive.dataTables.css" rel="stylesheet" />
    <link href="../style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container maincolor">
            <nav class="navbar navbackground">
                <div class="container-fluid">
                    <div class="navbar-header col-md-4">
                        <asp:Image ID="ImageUser" ImageUrl="~/Images/THS.jpg" Width="50px" Height="50px" runat="server" />
                    </div>
                    <div>
                        <div class="col-md-6">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">HOME</a></li>
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
                <li class="active"><a href="#">User Login</a></li>
            </ul>
            <div class="tab-content tabcontent">
                <div class="row rowtabcontent">
                    <div class="col-md-4 colrow lablealign">
                        <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Email :"></asp:Label>
                    </div>
                    <div class="col-md-8 colrow">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" Width="300px" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:Button ID="btnReset" BackColor="Blue" CssClass="btn btn-primary" runat="server" Text="Reset" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
            <div class="panel-footer">
            </div>
        </div>
    </form>

</body>
</html>
