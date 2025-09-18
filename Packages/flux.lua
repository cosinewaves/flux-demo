local REQUIRED_MODULE = require(script.Parent._Index["cosinewaves_flux@0.1.4"]["flux"])
export type StateCallback = REQUIRED_MODULE.StateCallback 
export type TransitionCallback<S> = REQUIRED_MODULE.TransitionCallback<S>
export type TransitionCheck<S> = REQUIRED_MODULE.TransitionCheck<S>
export type State<S> = REQUIRED_MODULE.State<S>
export type Middleware<S> = REQUIRED_MODULE.Middleware<S>
export type Unit<S> = REQUIRED_MODULE.Unit<S>
return REQUIRED_MODULE
