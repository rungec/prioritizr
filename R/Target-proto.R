#' @include internal.R pproto.R Parameters-proto.R ConservationModifier-proto.R
NULL

#' @export
methods::setOldClass("Target")

#' Target prototype
#'
#' This prototype is used to represent the targets used when making a
#' prioritization. This prototype inherits from the
#' \code{\link{ConservationModifier-class}}. \strong{This class represents a
#' recipe, to actually add targets to a planning problem, see the help page on
#' \code{\link{targets}}. Only experts should use this class directly.}
#'
#' @seealso \code{\link{ConservationModifier-class}}.
#'
#' @name Target-class
#'
#' @aliases Target
NULL

#' @export
Target <- pproto("Target", ConservationModifier)
