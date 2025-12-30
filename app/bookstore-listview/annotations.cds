using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Title',
            },
            {
                $Type : 'UI.DataField',
                Value : genre,
                Label : 'Genre',
            },
            {
                $Type : 'UI.DataField',
                Label : 'PublishedAt',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
                Label : 'Status',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Entry information',
            ID : 'Entryinformation',
            Target : '@UI.FieldGroup#Entryinformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status_Code',
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Tên sản phẩm',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'PublishedAt',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
        },
    ],
    UI.SelectionFields : [
        status_code,
    ],
    UI.HeaderInfo : {
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : genre,
        },
        TypeImageUrl : 'sap-icon://course-book',
    },
    UI.FieldGroup #Entryinformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
        ],
    },
    UI.HeaderFacets : [
        
    ],
    UI.FieldGroup #Status : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Author',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    price @Common.Label : 'Price'
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.Pages,
            Label : 'Pages',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : 'Number',
        },
    ]
);

annotate service.Books with {
    status @(
        Common.Text : status.displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.Label : 'Stats',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.BookStatus with {
    code @(
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

