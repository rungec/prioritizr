 #' @include internal.R OptimizationProblem-proto.R
NULL

#' Optimization problem
#'
#' Generate a new \code{\link{OptimizationProblem-class}} object.
#'
#' @return \code{\link{OptimizationProblem-class}} object.
#'
#' @seealso \code{\link{OptimizationProblem-methods}}
#'
#' @export
new_optimization_problem <- function() {
  pproto(NULL, OptimizationProblem, ptr = rcpp_new_optimization_problem())
}

#' Optimization problem methods
#'
#' These functions are used to access data from an
#' \code{\link{OptimizationProblem-class}} object.
#'
#' @param x \code{\link{OptimizationProblem-class}} object.
#'
#' @details The functions return the following data:
#'
#' \describe{
#'
#' \item{nrow}{\code{integer} number of rows (constraints).}
#'
#' \item{ncol}{\code{integer} number of columns (decision variables).}
#'
#' \item{ncell}{\code{integer} number of cells.}
#'
#' \item{modelsense}{\code{character} describing if the problem is to be
#'   maximized (\code{"max"}) or minimized (\code{"min"}).}
#'
#' \item{vtype}{\code{character} describing the type of each decision variable:
#'   binary (\code{"B"}), semi-continuous (\code{"S"}), or continuous
#'   (\code{"C"})}
#'
#' \item{obj}{\code{numeric} vector specifying the objective function.}
#'
#' \item{A}{\code{\link[Matrix]{dgCMatrix-class}} matrix object defining the
#'   problem matrix.}
#'
#' \item{rhs}{\code{numeric} vector with right-hand-side linear constraints}
#'
#' \item{sense}{\code{character} vector with the senses of the linear
#'   constraints (\code{"<="}, \code{">="}, \code{"="}).}
#'
#' \item{lb}{\code{numeric} lower bound for each decision variable. Missing data
#'   values (\code{NA}) indicate no lower bound for a given variable.}
#'
#' \item{ub}{\code{numeric} upper bounds for each decision variable. Missing data
#'   values (\code{NA}) indicate no upper bound for a given variable.}
#'
#' \item{number_of_planning_units}{\code{integer} number of planning units in
#'   the problem.}
#'
#' \item{number_of_features}{\code{integer} number of features
#'   the problem.}
#'
#' }
#'
#' @return \code{\link[Matrix]{dgCMatrix-class}}, \code{numeric} vector,
#'   \code{numeric} vector, or scalar \code{integer} depending on the method
#'   used.
#'
#' @name OptimizationProblem-methods
#'
#' @aliases nrow ncol ncell modelsense vtype obj A rhs sense lb ub number_of_features number_of_planning_units col_ids row_ids ncell,OptimizationProblem-method A,OptimizationProblem-method col_ids,OptimizationProblem-method lb,OptimizationProblem-method modelsense,OptimizationProblem-method ncol,OptimizationProblem-method nrow,OptimizationProblem-method number_of_features,OptimizationProblem-method number_of_planning_units,OptimizationProblem-method obj,OptimizationProblem-method rhs,OptimizationProblem-method row_ids,OptimizationProblem-method sense,OptimizationProblem-method ub,OptimizationProblem-method vtype,OptimizationProblem-method
NULL

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @importFrom raster nrow
#'
#' @exportMethod nrow
#'
#' @usage nrow(x)
#'
methods::setMethod("nrow", "OptimizationProblem", function(x) x$nrow())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @importFrom raster ncol
#'
#' @exportMethod ncol
#'
#' @usage ncol(x)
#'
methods::setMethod("ncol", "OptimizationProblem", function(x) x$ncol())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @importFrom raster ncell
#'
#' @exportMethod ncell
#'
#' @usage ncell(x)
#'
methods::setMethod("ncell", "OptimizationProblem", function(x) x$ncell())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod modelsense
#'
#' @usage modelsense(x)
#'
methods::setGeneric("modelsense", function(x) standardGeneric("modelsense"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
methods::setMethod("modelsense", "OptimizationProblem",
  function(x) x$modelsense())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod vtype
#'
#' @usage vtype(x)
#'
methods::setGeneric("vtype", function(x) standardGeneric("vtype"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("vtype", "OptimizationProblem", function(x) x$vtype())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod obj
#'
#' @usage obj(x)
#'
methods::setGeneric("obj", function(x) standardGeneric("obj"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("obj", "OptimizationProblem", function(x) x$obj())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod A
#'
#' @usage A(x)
#'
methods::setGeneric("A", function(x) standardGeneric("A"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("A", "OptimizationProblem", function(x) x$A())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod rhs
#'
#' @usage rhs(x)
#'
methods::setGeneric("rhs", function(x) standardGeneric("rhs"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("rhs", "OptimizationProblem", function(x) x$rhs())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod sense
#'
#' @usage sense(x)
#'
methods::setGeneric("sense", function(x) standardGeneric("sense"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("sense", "OptimizationProblem", function(x) x$sense())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod lb
#'
#' @usage lb(x)
#'
methods::setGeneric("lb", function(x) standardGeneric("lb"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("lb", "OptimizationProblem", function(x) x$lb())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod ub
#'
#' @usage ub(x)
#'
methods::setGeneric("ub", function(x) standardGeneric("ub"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("ub", "OptimizationProblem", function(x) x$ub())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod number_of_features
#'
#' @usage number_of_features(x)
#'
methods::setGeneric("number_of_features",
  function(x) standardGeneric("number_of_features"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("number_of_features", "OptimizationProblem",
  function(x) x$number_of_features())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod number_of_planning_units
#'
#' @usage number_of_planning_units(x)
#'
methods::setGeneric("number_of_planning_units",
  function(x) standardGeneric("number_of_planning_units"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("number_of_planning_units", "OptimizationProblem",
  function(x) x$number_of_planning_units())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod col_ids
#'
#' @usage col_ids(x)
#'
methods::setGeneric("col_ids", function(x) standardGeneric("col_ids"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("col_ids", "OptimizationProblem",
  function(x) x$col_ids())

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
#' @exportMethod row_ids
#'
#' @usage row_ids(x)
#'
methods::setGeneric("row_ids", function(x) standardGeneric("row_ids"))

#' @name OptimizationProblem-methods
#'
#' @rdname OptimizationProblem-methods
#'
methods::setMethod("row_ids", "OptimizationProblem", function(x) x$row_ids())
