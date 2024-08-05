module Vike.HelloWorld where

import Router.ADT (Route(..))
import Vike (VikePage, makeVikePage)

vike :: VikePage
vike = makeVikePage HelloWorld