workspace "christianwestbrook.dev" "Christian Westbrook's personal blog site" {

    !identifiers hierarchical

    model {
        ba = person "Blog Author"
        br = person "Blog Reader"

        cwdev = softwareSystem "christianwestbrook.dev"

        ba -> cwdev "Writes Content For"
        br -> cwdev "Consumes Content From"
    }

    views {
        systemContext cwdev "SystemContext" {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape Person
                background #FF8C42
                color #252525
            }

            element "Software System" {
                background #5B9BD5
            }
        }

    }
}