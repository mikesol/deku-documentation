module Examples.UnsafePursx where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Pursx ((~!~))

main :: ExampleSignature
main runExample = runExample ("<h4>(un)safe!</h4>" ~!~ {})