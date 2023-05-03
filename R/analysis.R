#' Display a project risk-reward bubble plot
#'
#' @param data A dataset with columns Success_prob, Reward, Effort, Group, and Project (name)
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
#' library(tibble)
#' data <- tibble::tibble(Success_prob=c(0.1,0.9),Reward=c(0.3,0.7),
#'        Effort=c(0.3,0.5),Project=c("A","B"),Group=c("Old","New"))
#' plot_risk_reward(data)
plot_risk_reward <- function(data) {
  ggplot2::ggplot(data,ggplot2::aes(y=Success_prob,x=Reward,col=Group,size=Effort,label=Project)) +
    ggplot2::geom_point() + ggrepel::geom_text_repel(col="black",size=3)+
    ggplot2::coord_cartesian(xlim = c(1,0),ylim=c(0,1))+ ggplot2::theme_bw() + ggplot2::scale_size_continuous(range=c(3,15)) +
    ggplot2::geom_hline(yintercept = 0.5) + ggplot2::geom_vline(xintercept = 0.5) +
    ggplot2::geom_text(data=tibble(x=c(0.2,0.23,0.92,0.95),y=c(0.0,1,0,1),label=c("White elephant","Bread and Butter","Oyster","Pearl")),
                       ggplot2::aes(x=x,y=y,label=label),inherit.aes = F,fontface="bold") + ggplot2::ylab("Success probability")
}
