Imports System
Imports System.IO
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Sql

Partial Class onlineregistration
    Inherits System.Web.UI.Page
    Dim constr, str, codestr, codeval, strttl As String
    Dim con As SqlConnection
    Dim ds As New dataset
    Dim da As SqlDataAdapter
    Dim i As Integer
    Dim dt As New DataTable
    Dim dr As SqlDataReader
    Dim cmd As SqlCommand
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load




        If Not Page.IsPostBack Then
            consub()
            lblmsg.Text = ""
            bindstate()

            bindcountry()
        End If



    End Sub
    Sub consub()
        constr = ConfigurationManager.ConnectionStrings("myDbConnection").ConnectionString
        con = New SqlConnection(constr)
        con.Open()
    End Sub
    Sub bindstate()
        consub()

        cmd = New SqlCommand("SELECT * FROM state_tbl", con)
        cmd.CommandType = CommandType.Text
        ddlstate.DataSource = cmd.ExecuteReader()
        ddlstate.DataTextField = "statename"
        ddlstate.DataValueField = "statecode"

        ddlstate.DataBind()
        con.Close()


    End Sub
    Sub bindcountry()
        consub()

        cmd = New SqlCommand("SELECT * FROM country_tbl", con)
        ddlcountry.DataSource = cmd.ExecuteReader()
        ddlcountry.DataTextField = "countryname"
        ddlcountry.DataValueField = "countrycode"

        ddlcountry.DataBind()
            con.Close()

    End Sub

    Private Sub btnsubmit_Click(sender As Object, e As EventArgs) Handles btnsubmit.Click
        consub()
        codestr = ""
        cmd = New SqlCommand("select * from code_master", con)
        dr = cmd.ExecuteReader
        If dr.Read() Then
            codeval = dr!code_value
            codestr = codestr + dr!code_name + "-" + codeval + ""
            codeval = codeval + 1

        End If

        cmd = New SqlCommand("update code_master set code_value=" & codeval & "", con)
        cmd.ExecuteNonQuery()
        cmd.Dispose()

        cmd = New SqlCommand("select * from registration_detail where email='" & txtemail.Text & "'", con)
        dr = cmd.ExecuteReader
        If dr.HasRows Then
            lblmsg.Visible = True
            lblmsg.Text = "<p style='color:red;font-weight:bold;'>Email Id Already Exist..!</p>"
        Else
            If ddlttl.SelectedValue = 0 Then
                strttl = "Mr."
            ElseIf ddlttl.SelectedValue = 1 Then
                strttl = "Mrs."
            Else
                strttl = "Miss."
            End If

            str = "insert into registration_detail(reg_id,name,designation,gender,address1,address2,address3,city,state,country,pincode,mobile,email) values('" & codestr & "','" & strttl & "'+'" & txtname.Text & "','" & txtdesignation.Text & "', '" & rbtngender.SelectedValue & "','" & txtaddressln1.Text & "','" & txtaddressln2.Text & "','" & txtaddressln3.Text & "','" & txtcity.Text & "','" & hidstatevalue.Value & "', '" & hidcountryvalue.Value & "','" & txtpincode.Text & "','" & txtmobile.Text & "','" & txtemail.Text & "')"

            cmd = New SqlCommand(str, con)
            cmd.ExecuteNonQuery()
            lblmsg.Visible = True
            lblmsg.Text = "<p style='color:green;font-weight:bold;'>You have Submitted Successfully..!</p>"
        End If


        con.Close()

    End Sub

    Private Sub ddlstate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlstate.SelectedIndexChanged
        consub()
        cmd = New SqlCommand("select * from state_tbl where statename='" & ddlstate.SelectedItem.Text & "'", con)
        dr = cmd.ExecuteReader
        If dr.Read Then
            hidstatevalue.Value = dr!statecode
        End If
        con.Close()
    End Sub

    Private Sub ddlcountry_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlcountry.SelectedIndexChanged
        consub()
        cmd = New SqlCommand("select * from country_tbl where countryname='" & ddlcountry.SelectedItem.Text & "'", con)
        dr = cmd.ExecuteReader
        If dr.Read Then
            hidcountryvalue.Value = dr!countrycode
        End If
        con.Close()
    End Sub
End Class
