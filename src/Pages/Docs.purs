module Pages.Docs where

import Prelude


import Contracts (Docs(..))
import Pages.AdvancedUsage (advancedUsage)
import Pages.CoreConcepts (coreConcepts)
import Pages.FRP (frp)
import Pages.Introduction (introduction)

docs :: forall lock payload. Docs lock payload
docs = Docs [ introduction, coreConcepts, frp, advancedUsage ]