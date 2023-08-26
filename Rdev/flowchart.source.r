




library(DiagrammeR)

flowchart_eligible_randomized <- function(n_total, n_eligible, n_randomized, n_GroupA, n_GroupB, n_refused, n_contraindicated) {
  DiagrammeR::grViz(paste0('
    digraph G {
        // Global attributes
        rankdir=TB;
        node [shape=box, style="rounded"];

        // Define the nodes
        Total [label="Total population\nn = ', format(n_total, big.mark = ","), '", width=3, fixedsize=true]
        eligible [label="Eligible\nn = ', format(n_eligible, big.mark = ","), '", width=3, fixedsize=true]
        randomized [label="Randomized\nn = ', format(n_randomized, big.mark = ","), '", width=3, fixedsize=true]
        GroupA [label="Group A\nn = ', format(n_GroupA, big.mark = ","), '"]
        GroupB [label="Group B\nn = ', format(n_GroupB, big.mark = ","), '"]
        excluded [label="Excluded (n = ', format(n_refused + n_contraindicated, big.mark = ","), '):\n - refused: ', format(n_refused, big.mark = ","), '\n - contra-indicated: ', format(n_contraindicated, big.mark = ","), '"]

        // Define the edges
        Total -> eligible
        eligible -> randomized
        randomized -> GroupA [label="', format(n_GroupA, big.mark = ","), '"]
        randomized -> GroupB [label="', format(n_GroupB, big.mark = ","), '"]
        eligible -> excluded [style="dashed"]

        // Use a subgraph to align Eligible and Excluded horizontally
        {
            rank=same;
            eligible; excluded;
        }
    }
  '))
}


flowchart_eligible_randomized(1632798, 10032, 122, 43, 49, 12, 18)


#@ end -----
