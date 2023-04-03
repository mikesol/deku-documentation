module Pages.Docs where

import Prelude

import Contracts (Docs(..))
import Pages.AdvancedUsage (advancedUsage)
import Pages.CoreConcepts (coreConcepts)
import Pages.FRP (frp)
import Pages.Introduction (introduction)

docs :: Docs
docs = Docs [ introduction, coreConcepts, frp, advancedUsage ]