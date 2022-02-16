<%@ Page Language="VB" AutoEventWireup="false" CodeFile="onlineregistration.aspx.vb" Inherits="onlineregistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="regformdiv" runat="server">
            <table id="tblregform" width="100%" runat="server" align="centre"  >
                <tr><td colspan ="2"> <h2>Registration Form</h2></td></tr>
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td width="20%"><asp:Label ID="lbltitle" Text="Title" style="font-weight :bold;" runat="server"></asp:Label> </td>
                    <td width="80%"><asp:dropdownlist ID="ddlttl" runat="Server">
                        <asp:Listitem Text ="Mr." Value="0"></asp:Listitem>
                        <asp:ListItem Text ="Mrs." Value="1"></asp:ListItem>
                       <asp:ListItem Text="Miss." Value ="2"></asp:ListItem>
                                    </asp:dropdownlist></td></tr>
                <tr><td width="20%"><asp:Label ID="lblname" Text="Name *" style="font-weight :bold;" runat ="server" ></asp:Label></td>
                    <td width="80%"><asp:TextBox ID="txtname" Width="30%" MaxLength ="225" runat ="server"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td width="20%"><asp:Label ID="lbldesignation" text="Designation" style="font-weight :bold;" runat="server"></asp:Label></td>
                <td width="80%"><asp:TextBox ID="txtdesignation" Width="30%" runat="server" ></asp:TextBox></td></tr>
            <tr><td width="20%"><asp:Label ID="lblage" Text="Age" style="font-weight :bold;"  runat="server" ></asp:Label></td>
                <td width="80%"><asp:TextBox ID="txtage" Width="5%" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td width="20%"><asp:Label ID="lblgender" Text="Gender" style="font-weight :bold;" runat="server"></asp:Label>
                </td><td width="80%"><asp:radiobuttonlist ID="rbtngender" RepeatDirection="Horizontal" TextAlign="Right" runat ="server">
                    <asp:ListItem Text ="Male" Value="0" Selected="True" ></asp:ListItem>
                        <asp:listitem text="Female" value="1"></asp:listitem>

                </asp:radiobuttonlist>
                </td></tr> 
<tr><td width="20%" style="vertical-align :top;"><asp:Label ID="lbladdress" runat="server" Text="Address for Communication *" style="font-weight :bold;"></asp:Label></td>
    <td width="80%"><asp:TextBox ID="txtaddressln1" Width="30%"  runat="server" ></asp:TextBox><br />
        <asp:TextBox ID="txtaddressln2" Width="30%" runat="server"></asp:TextBox><br>
        <asp:TextBox ID="txtaddressln3" Width="30%" runat="server" ></asp:TextBox>
    </td>
</tr>
<tr><td width="20%"><asp:Label ID="lblcity" Text="City *" style="font-weight :bold;" runat="server" ></asp:Label></td>
    <td width="80%"><asp:TextBox ID="txtcity" Width="30%" runat="server"></asp:TextBox></td>
</tr>

<tr><td width="20%"><asp:Label id="lblstate" Text="State" style="font-weight :bold;" runat="server" ></asp:Label></td>
    <td width="80%"><asp:DropDownList  ID="ddlstate"  runat="server" >
          
                    </asp:DropDownList> <asp:HiddenField ID="hidstatevalue" runat="server" /></td>
</tr>
<tr><td width="20%"><asp:Label ID="lblcountry" Text ="Country" style="font-weight :bold;" runat="server" ></asp:Label></td>
    <td width="80%"><asp:DropDownList ID="ddlcountry" runat="server" ></asp:DropDownList> <asp:HiddenField ID="hidcountryvalue" runat="server" /></td>
</tr>
<tr><td width="20%"><asp:Label ID="lblpincode" Text ="Pincode *" style="font-weight :bold;" runat ="server" ></asp:Label></td>
    <td width="80%"><asp:TextBox ID="txtpincode" Width="10%" runat="server" ></asp:TextBox></td>
</tr>
<tr><td width="20%"><asp:Label ID="lblphone" Text="Phone" style="font-weight :bold;" runat ="server" ></asp:Label></td>
    <td width="80%"><asp:TextBox ID="txtphone" Width="30%" runat="server" ></asp:TextBox></td>
</tr>
<tr><td width="20%"><asp:Label ID="lblmobile" Text="Mobile *" style="font-weight :bold;" runat ="server" ></asp:Label></td>
    <td width="80%"><asp:TextBox ID="txtmobile" Width="30%" runat="server" ></asp:TextBox></td>
</tr>

<tr><td width="20%"><asp:Label ID="lblemail" Text="E-Mail *" style="font-weight :bold;" runat ="server" ></asp:Label></td>
    <td width="80%"><asp:TextBox ID="txtemail" Width="30%" runat="server" ></asp:TextBox></td>
</tr>
<tr><td colspan="2">&nbsp;</td></tr>
                
<tr><td colspan="2" ><asp:Button ID="btnsubmit" Text ="Submit" style="background-color:#00405B;color:white;font-size:14px;font-weight:bold;border-radius:10%;padding:1%;" runat="server" /></td></tr>

                <tr><td colspan="2" ><asp:label ID="lblmsg" style="color:red;" runat="server"></asp:label></td></tr>

            </table>

        </div>
    </form>
</body>
</html>
