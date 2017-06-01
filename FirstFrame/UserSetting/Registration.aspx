<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FirstFrame.UserSetting.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registeration</title>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/datepicker.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <%--    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui.min.js" type="text/javascript"></script>--%>
    <%--<link href="../Content/bootstrap.css" rel="stylesheet" />--%>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/style_v2.css" rel="stylesheet" />
    <%--<link href="../Content/bootstrap-theme.css" rel="stylesheet" />--%>
    <link href="../style.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("[id$=txtBirthDate]").datepicker({
                dateFormat: 'dd-mm-yy',
                //showOn: 'both',
                changeMonth: true,
                changeYear: true

            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container maincolor">

            <nav class="navbar navbackground">

                <div class="container-fluid">

                    <div class="navbar-header col-md-4 ">
                        <asp:Image ID="ImageUser" ImageUrl="~/Images/THS.jpg" class="userImage" runat="server" />
                    </div>

                    <%--<div class="col-md-6 headernav" style="font-size: small; text-align: right; margin-right: 2px;">
                        <div class="header-top" style="text-decoration: none;">
                            <div id="menu-button">
                                <%--<div class="centralizer">--%>
                                   <%-- <div class="cursor">
                                        <span class="hide">Menu</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                       <div id="menu-close-button" class="">x</div>
                                    </div>--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <ul class="nav navbar-nav">
                                <li class="active"><a href="RoomService.aspx">HOME</a></li>
                                <li><a href="#">ABOUT</a></li>
                                <li><a href="#">CONTACT US</a></li>
                            </ul>
                        <%--</div>
                    </div>--%>

                    <div class="col-md-2">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Login.aspx">Login</a></li>
                        </ul>
                    </div>

                </div>

            </nav>

            <ul class="nav nav-tabs tab">
                <li class="active"><a href="#">User Registration</a></li>
            </ul>

            <div class="tab-content tabcontent">

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="First Name :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*** Please enter you first name!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Last Name : "></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtLastName" CssClass="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="***Please enter you last name!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row  rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Email :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" TextMode="Email" placeholder="Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="rqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*** Please enter your Email!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Re-Enter Email :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtReEmail" CssClass="form-control" placeholder="Re-Enter Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="rqReEmail" runat="server" ControlToValidate="txtReEmail" ErrorMessage="*** Please enter your Email!"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compareEmail" ControlToValidate="txtEmail" ControlToCompare="txtReEmail" runat="server" ErrorMessage="*** Emails do not match!"></asp:CompareValidator>
                    </div>
                </div>

                <div class="row rowtabcontent ">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="New Password :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtpassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqpassword" runat="server" ControlToValidate="txtpassword" ErrorMessage="*** Please enter password!"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExppassword" ControlToValidate="txtpassword" ValidationExpression="^[\s\S]{5,20}$" runat="server" ErrorMessage="Password must be between 8 and 20"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label6" runat="server" CssClass="control-label" Text="Designation :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtDesignation" CssClass="form-control" placeholder="Designation" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqDesignation" runat="server" ControlToValidate="txtDesignation" ErrorMessage="*** Please enter Designation!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Company Name :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtCompany" CssClass="form-control" placeholder="Company Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqCompany" runat="server" ControlToValidate="txtCompany" ErrorMessage="*** Please enter your Company!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label8" runat="server" CssClass="control-label" Text="Gender :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:RadioButtonList ID="radioGender" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Text="Male" Value="True" />
                            <asp:ListItem Text="Female" Value="False" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqRadio" runat="server" ControlToValidate="radioGender" ErrorMessage="*** Please Choose Gender!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="Birth Day :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtBirthDate" CssClass="form-control" runat="server" placeholder="dd-mm-yyyy" Width="100px"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqBirthDate" runat="server" ControlToValidate="txtBirthDate" ErrorMessage="*** Please Choose Your Birth Date!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label10" runat="server" CssClass="control-label" Text="Upload Photo :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:FileUpload ID="imageUpload" runat="server" />
                    </div>
                    <div class="col-md-4 colrow">
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-4 colrow">
                    </div>
                    <div class="col-md-2 colrow colrowdivide">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />

                    </div>
                    <div class="col-md-2 colrow colrowdivide">
                        <asp:Button ID="btnClear" runat="server" CssClass="btn btn-primary" Text="Clear" OnClick="btnClear_Click" />
                    </div>
                    <div class="col-md-4 colrow">
                    </div>
                </div>

            </div>

            <div class="panel-footer">
            </div>

        </div>
    </form>
</body>

</html>
