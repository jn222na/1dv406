<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumEdit.aspx.cs" Inherits="AlbumSamling.Pages.AlbumEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
         <h1>
        Redigera Album
    </h1>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary-errors" />
    <asp:FormView ID="AlbumFormView" runat="server"
        ItemType="AlbumSamling.Model.AlbumProp"
        DataKeyNames="AlbumId"
        DefaultMode="Edit"
        RenderOuterTable="false"
        SelectMethod="AlbumFormView_GetData"
        UpdateMethod="AlbumFormView_UpdateItem">
        <EditItemTemplate>
            <div class="editor-label">
                <label for="AlbumTitel">AlbumTitel</label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="AlbumTitel" runat="server" Text='<%# BindItem.AlbumTitel %>' />
            </div>
            <div class="editor-label">
                <label for="ArtistTitel">ArtistTitel</label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="ArtistTitel" runat="server" Text='<%# BindItem.ArtistTitel %>' />
            </div>
            <div class="editor-label">
                <label for="Utgivningsår">Utgivningsår</label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="Utgivningsår" runat="server" Text='<%# BindItem.Utgivningsår %>' />
            </div>
            <div>
                <asp:LinkButton ID="LinkButton1" runat="server" Text="Spara" CommandName="Update" />
                <asp:HyperLink ID="HyperLink1" runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("Index", new { id = Item.AlbumID }) %>' />
            </div>
        </EditItemTemplate>
    </asp:FormView>
    </div>
    </form>
</body>
</html>
