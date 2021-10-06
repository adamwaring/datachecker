#' eda_explore_tabbox UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_eda_explore_tabbox_ui <- function(id){
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
        tabName = "Univariate distributions",
        active = T,
        plotOutput(ns("univariate"))
      ),
      argonR::argonTab(
        tabName = "Bivariate distributions",
        active = F,
        plotOutput(ns("bivariate"))
      ),
      argonR::argonTab(
        tabName = "Correlation with target",
        active = F,
        plotOutput(ns("cor_with_target"))
      )
    )
  )

}

#' eda_explore_tabbox Server Functions
#'
#' @noRd
mod_eda_explore_tabbox_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # univariate
    output$univariate <- renderPlot({

      plots = autoEDA::autoEDA(datasets::airquality, returnPlotList = T)$plots

      cowplot::plot_grid(plotlist=plots)

      #https://github.com/XanderHorn/autoEDA

    })

    # bivariate
    output$bivariate = renderPlot({

      PerformanceAnalytics::chart.Correlation(datasets::airquality, histogram=TRUE, pch=19)

    })

    # correlation target
    output$cor_with_target = renderPlot({

      plots = autoEDA::autoEDA(datasets::airquality, "Ozone", returnPlotList = T)$plots

      cowplot::plot_grid(plotlist=plots)

    })

  })
}

## To be copied in the UI
# mod_eda_explore_tabbox_ui("eda_explore_tabbox_ui_1")

## To be copied in the server
# mod_eda_explore_tabbox_server("eda_explore_tabbox_ui_1")
