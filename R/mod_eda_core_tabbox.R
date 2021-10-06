#' eda_core_tabbox UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_eda_core_tabbox_ui <- function(id){
  ns <- NS(id)
  tagList(

    argonR::argonH1("Horizontal Tabset", display = 4),

    argonR::argonTabSet(
      id = ns("tab-1"),
      card_wrapper = TRUE,
      horizontal = TRUE,
      circle = FALSE,
      size = "sm",
      width = 12,
      iconList = lapply(X = 1:3, FUN = argonR::argonIcon, name = "atom"),

      argonR::argonTab(
        tabName = "Features overview",
        active = T,
        DT::DTOutput(ns("feature_overviews"))
      ),
      argonR::argonTab(
        tabName = "Outliers",
        active = F,
        plotOutput(ns("outliers"))
      ),
      argonR::argonTab(
        tabName = "Missingness",
        active = F,
        plotOutput(ns("missingness"))

      )
    )

  )
}

#' eda_core_tabbox Server Functions
#'
#' @noRd
mod_eda_core_tabbox_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    dataset = reactive(datasets::airquality)

    # feature overviews tab
    output$feature_overviews = DT::renderDT(autoEDA::autoEDA(datasets::airquality, returnPlotList = T)$overview)

    # missingness tab
    output$missingness = renderPlot(dataset() %>% finalfit::missing_plot())

    #finalfit::missing_pairs()
    #finalfit::missing_compare()
    # https://cran.r-project.org/web/packages/finalfit/vignettes/missing.html

    # outlier tab
    output$outliers = renderPlot(dataset() %>% boxplot(datasets::airquality))


  })
}

## To be copied in the UI
# mod_eda_core_tabbox_ui("eda_core_tabbox_ui_1")

## To be copied in the server
# mod_eda_core_tabbox_server("eda_core_tabbox_ui_1")
