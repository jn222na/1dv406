<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" ViewStateMode="Disabled" Inherits="AlbumSamling.Pages.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">

        <div>
            <asp:Label runat="server" ID="Statuslabel" Visible="false" Text=""></asp:Label>
            <asp:ListView ID="CustomerListView1" runat="server"
                ItemType="AlbumSamling.Model.CustomerProp"
                SelectMethod="CustomerListView_GetData"
                DeleteMethod="ContactListView_DeleteItem"
                InsertMethod="ContactFormView_InsertItem"
                InsertItemPosition="FirstItem"
                DataKeyNames="CustomerId">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <th>Förnamn
                            </th>
                            <th>Efternamn
                            </th>
                            <th>Ort
                            </th>
                            <th>AlbumTitel
                            </th>
                            <th>ArtistTitel
                            </th>
                            <th>Utgivningsår
                            </th>
                            <th>Telefonnummer
                            </th>
                            <th runat="server" id="itemPlaceholder">Ort
                            </th>
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#: Item.Förnamn %>
                        </td>
                        <td>
                            <%#: Item.Efternamn %>
                        </td>
                        <td>
                            <%#: Item.Ort %>
                        </td>
                        <td>
                            <%#: Item.AlbumTitel %>
                        </td>
                        <td>
                            <%#: Item.ArtistTitel %>
                        </td>
                        <td>
                            <%#: Item.Utgivningsår %>
                        </td>
                        <td>
                            <%#: Item.Number %>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# GetRouteUrl("IndexEditRoute", new {KundID = Item.CustomerId}) %>' runat="server">Redigera Kontakt</asp:HyperLink>
                        </td>
                        <td>
                            <asp:LinkButton ID="Delete" CommandName="Delete" runat="server" Text="Ta Bort" OnClientClick='<%# String.Format("return confirm(\"Ta bort namnet {0} {1}?\")", Item.Förnamn, Item.Efternamn) %>'></asp:LinkButton>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# GetRouteUrl("AlbumEditRoute", new {AlbumID = Item.AlbumID}) %>' runat="server">Redigera album</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <%-- Detta visas då kunder saknas i databasen. --%>
                    <p>
                        Kunder saknas.
                    </p>
                </EmptyDataTemplate>

                <InsertItemTemplate>
                    <tr>

                        <td>
                            <asp:TextBox ID="Förnamn" runat="server" Text='<%# BindItem.Förnamn %>' MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="Förnamn måste anges"
                                ControlToValidate="Förnamn" ValidationGroup="Insert" Display="None">

                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="Efternamn" runat="server" Text='<%# BindItem.Efternamn %>' MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="Efternamn måste anges"
                                ControlToValidate="Efternamn" ValidationGroup="Insert" Display="None">
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="Ort" runat="server" Text='<%# BindItem.Ort %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ErrorMessage="Ort måste anges"
                                ControlToValidate="Ort" ValidationGroup="Insert" Display="None">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="AlbumTitel" runat="server" Text='<%# BindItem.AlbumTitel %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                ErrorMessage="AlbumTitel måste anges"
                                ControlToValidate="AlbumTitel" ValidationGroup="Insert" Display="None">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="ArtistTitel" runat="server" Text='<%# BindItem.ArtistTitel %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ErrorMessage="ArtistTitel måste anges"
                                ControlToValidate="ArtistTitel" ValidationGroup="Insert" Display="None">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="Utgivningsår" runat="server" Text='<%# BindItem.Utgivningsår %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                ErrorMessage="Utgivningsår måste anges"
                                ControlToValidate="Utgivningsår" ValidationGroup="Insert" Display="None">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="Number" Visible="false"></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="Number">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:LinkButton ID="Insert" runat="server" CommandName="Insert" Text="Lägg till" />
                            <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

        </div>
    </form>
</body>
</html>
