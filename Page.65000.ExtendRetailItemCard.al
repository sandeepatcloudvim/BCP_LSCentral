pageextension 65000 Extend_LSCRetailItem extends "LSC Retail Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
                Caption = 'Product Code';
            }
        }
        addafter(Description)
        {
            field("LSC Attrib 1 Code"; Rec."LSC Attrib 1 Code")
            {
                ApplicationArea = All;
                Caption = 'Attrib 1 Code';
            }
            field(BrandDescription; BrandDescription)
            {
                ApplicationArea = All;
                Caption = 'Brand Description';
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        BrandDescription: Text[100];
        LSCAttrOptionValue: Record "LSC Attribute Option Value";

    trigger OnAfterGetRecord()
    var
    begin
        Clear(BrandDescription);
        LSCAttrOptionValue.Reset();
        LSCAttrOptionValue.SetRange("Option Value", Rec."LSC Attrib 1 Code");
        if LSCAttrOptionValue.FindFirst() then
            BrandDescription := LSCAttrOptionValue."Option Value (Cust.)";
    end;

}