<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FirstFrame.UserSetting.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default</title>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/datepicker.css" rel="stylesheet" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="../style.css" rel="stylesheet" />
    <script>
        //$.get('Login.aspx', function (data){
        //    $("#login").attr("value", data);
        //});
    </script>
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
                <li class="active"><a href="#">User Registration</a></li>
            </ul>
            <div class="tab-content tabcontent">

                <div class="row rowtabcontent">

                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="First Name :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtFirstName" Width="300px" CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>

                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Last Name : "></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtLastName" Width="300px" CssClass="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Email :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtEmail" Width="300px" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Re-Enter Email :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtReEmail" Width="300px" CssClass="form-control" placeholder="Re-Enter Email" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="New Password :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtpassword" Width="300px" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label6" runat="server" CssClass="control-label" Text="Designation :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtDesignation" Width="300px" CssClass="form-control" placeholder="Designation" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Company Name :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtCompany" Width="300px" CssClass="form-control" placeholder="Company Name" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label8" runat="server" CssClass="control-label" Text="Gender :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:RadioButtonList ID="radioGender" Class="radioButtonList" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="True" />
                            <asp:ListItem Text="Female" Value="False" />
                        </asp:RadioButtonList>

                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">
                        <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="Birth Day :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtBirthDate" CssClass="form-control" runat="server" placeholder="dd-mm-yyyy" Width="100px"></asp:TextBox>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-6 colrow">

                        <asp:Label ID="Label10" runat="server" CssClass="control-label" Text="Upload Photo :"></asp:Label>

                    </div>
                    <div class="col-md-6 colrow">
                        <asp:FileUpload ID="imageUpload" runat="server" />
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-4 colrow">
                    </div>
                    <div class="col-md-8 colrow colrowdivide">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" />
                        <asp:Button ID="btnClear" runat="server" CssClass="btn btn-primary" Text="Clear" />
                    </div>
                </div>

            </div>
            <div class="panel-footer">
            </div>
        </div>

    </form>
</body>
</html>
