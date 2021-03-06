% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_connectivity_penalties.R
\name{add_connectivity_penalties}
\alias{add_connectivity_penalties}
\title{Add connectivity penalties}
\usage{
add_connectivity_penalties(x, penalty, connectivity_data)
}
\arguments{
\item{x}{\code{\link{ConservationProblem-class}} object.}

\item{penalty}{\code{numeric} penalty for missing connections between
planning units. This is equivalent to the connectivity strength modifier
(CSM; (Beger et al. 2010)). Defaults to one so that penalties are the
same as the values in the \code{data}.}

\item{connectivity_data}{A \code{data.frame} or \code{matrix} 
object that shows the strength of connectivity between consecutive planning
 units. If \code{connectivity_data} is a matrix, then rows and columns represent
 each planing unit and the cell values represent the connectivity between
 them. If \code{connectivity_data} is a \code{data.frame} the column names must
 be \code{"id1"}, \code{"id2"}, \code{"boundary"}, where each row
 shows the connectivity between two planning units (following the Marxan
 format). The data can be used to denote symmetric or asymmetric
 relationships between planning units.}
}
\value{
\code{\link{ConservationProblem-class}} object.
}
\description{
Add constraints to a conservation problem to favor solutions that select
planning units with high connectivity between them. Uses connectivity data 
in the form of a \code{matrix} or \code{data.frame} object, where strength 
of connectivity is a value such as the inverse distance between consecutive 
planning units. This function can be used for symmetric or asymmetric 
relationships between planning units.
}
\examples{
# load data
data(sim_pu_points, sim_features)

# create a symmetric connectivity matrix where the connectivity between
# two planning units is the inverse distance between them
sc_matrix <- (1 / (as.matrix(dist(sim_pu_points@coords)) + 1))

# remove connections between planning unitswith little connectivity
sc_matrix[sc_matrix < 0.85] <- 0

# create basic problem
p1 <- problem(sim_pu_points, sim_features) \%>\%
  add_min_set_objective() \%>\%
  add_relative_targets(0.2)

# create problem with low connectivity penalties
p2 <- p1 \%>\% add_connectivity_penalties(25, sc_matrix)

# create problem with higher connectivity penalties
p3 <- p1 \%>\% add_connectivity_penalties(50, sc_matrix)

# create an asymmetric connectivity matrix where links from even numered
# units to odd numbered units have half the connectivity as from odd
# numbered units to even units
even_units <- seq(2, length(sim_pu_points), 2)
odd_units <- seq(1, length(sim_pu_points), 2)
ac_matrix <- sc_matrix
ac_matrix[even_units, odd_units] <- 0.5 * ac_matrix[even_units, odd_units]

# create problem with asymmetric connectivity and high penalties
p4 <- p1 \%>\% add_connectivity_penalties(50, ac_matrix)

\donttest{
# solve problems
s <- list(solve(p1), solve(p2), solve(p3), solve(p4))

# plot solutions
par(mfrow=c(2,2))

plot(s[[1]], pch=19, main="basic solution", cex = 1.5)
points(s[[1]][s[[1]]$solution==1, ], col = "darkgreen", pch = 19, cex = 1.5)

plot(s[[2]], pch=19, main="small penalties", cex = 1.5)
points(s[[2]][s[[2]]$solution==1, ], col = "darkgreen", pch = 19, cex = 1.5)

plot(s[[3]], pch=19, main="high penalties", cex = 1.5)
points(s[[3]][s[[3]]$solution==1, ], col = "darkgreen", pch = 19, cex = 1.5)

plot(s[[4]], pch=19, main="asymmetric connectivity", cex = 1.5)
points(s[[4]][s[[4]]$solution==1, ], col = "darkgreen", pch=19, cex = 1.5)
}

}
\seealso{
\code{\link{constraints}}, \code{\link{add_boundary_penalties}},
 \code{\link{penalties}}.
}
