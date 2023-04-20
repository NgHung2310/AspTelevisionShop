<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="SaleTelevisionWeb.Customer.Sidebar" %>

<div class="col-lg-3">
    <!-- Categories-->
    <h3 class="h4 lined text-uppercase mb-2">Price</h3>
    <ul class="nav flex-column nav-pills mb-4">
        <li class="nav-item">
            <asp:LinkButton ID="lbtnPriceHighToLow" runat="server" CssClass="nav-link">            
                <div class="d-flex align-items-center justify-content-between">
                    <span class="fw-bold text-uppercase">High to low</span>
                <div class="badge bg-secondary"><i class="fas fa-sort-amount-down"></i></div>
            </div></asp:LinkButton>
        </li>
        <li class="nav-item">
            <asp:LinkButton ID="lbtnPriceLowToHigh" runat="server" CssClass="nav-link">            
                <div class="d-flex align-items-center justify-content-between">
                <span class="fw-bold text-uppercase">Low to high</span>
                <div class="badge bg-secondary"><i class="fas fa-sort-amount-up"></i></div>
            </div></asp:LinkButton>
        </li>
    </ul>
    <!-- Resolution        -->
    <div class="d-flex align-items-center justify-content-between mb-2">
        <h3 class="h4 lined text-uppercase">Resolution</h3>
    </div>
    <div class="mb-4">
        <asp:DataList ID="dtLstResolution" runat="server" RepeatColumns="1">
            <ItemTemplate>
                <div class="form-check">
                    <input class="form-check-input" id="cbxResolution" type="checkbox" runat="server" value='<%# Eval("Resolution") %>'>
                    <label class="ps-2 form-label" runat="server"><%# Eval("Resolution") %></label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <!-- Brandname-->
    <div class="d-flex align-items-center justify-content-between mb-2">
        <h3 class="h4 lined text-uppercase">Brandname</h3>
    </div>
    <div class="mb-4">
        <asp:DataList ID="dtLstBrandname" runat="server" RepeatColumns="1">
            <ItemTemplate>
                <div class="form-check">
                    <input class="form-check-input" id="cbxBrandname" type="checkbox" runat="server" value='<%# Eval("Brandname") %>'>
                    <label class="ps-2 form-label" runat="server"><%# Eval("Brandname") %></label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <!-- Type-->
    <div class="d-flex align-items-center justify-content-between mb-2">
        <h3 class="h4 lined text-uppercase">Type</h3>
    </div>
    <div class="mb-4">
        <asp:DataList ID="dtLstType" runat="server" RepeatColumns="1">
            <ItemTemplate>
                <div class="form-check">
                    <input class="form-check-input" id="cbxType" type="checkbox" runat="server" value='<%# Eval("Type") %>'>
                    <label class="ps-2 form-label" runat="server"><%# Eval("Type") %></label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:LinkButton ID="lbtnClearFilter" runat="server" CssClass="btn btn-lg btn-outline-danger mt-0 mb-4" Width="100%"><i class="fas fa-times-circle me-2"></i>Clear filter</asp:LinkButton>
    <asp:LinkButton ID="lbtnApplyFilter" runat="server" CssClass="btn btn-lg btn-outline-primary mt-0 mb-4" Width="100%"><i class="fas fa-pencil-alt me-2"></i>Apply filter</asp:LinkButton>
    <a class="d-inline-block" href="#">
        <img class="img-fluid" src="../img/banner.jpg" alt=""></a>
</div>
