import os
import json

examples = [x for x in os.listdir('./src/Examples') if ".purs" in x]

with open('./src/Examples.js','w') as ofi:
    for example in examples:
        lex = example[0].lower() + example[1:-5]
        print(f'./src/Examples/{example}')
        with open(f'./src/Examples/{example}','w') as ifi:
            i = ifi.read().split('\n')
            IN_IMPORTS = False
            O = []
            for x in i:
                if x.split(' ')[0] == 'import':
                    IN_IMPORTS = True
                    O.append(x)
                else:
                    if IN_IMPORTS:
                        O.append('import Deku.Toplevel (runInBody)')
                        IN_IMPORTS = False
                        O.append(x)
                    else:
                        if x.split(' ')[0] == 'main':
                            break
            joined = '\n'.join(O).replace('app :: ExampleSignature','main :: Effect Unit').replace('app runExample =','main =')
            ofi.write(f'export const {lex}URL = {json.stringify(joined)};\n')

with open('./src/Examples.purs','w') as ofi:
    ofi.write('module Examples (Examples(..), ExampleADT(..), examples, exampleToString, exampleToSlug, exampleToApp) where\n\nimport Data.Newtype (class Newtype, unwrap)\nimport ExampleAssitant (ExampleSignature)\n')
    for example in examples:
        lex = example[:-5]
        ofi.write(f'import Examples.{lex} as {lex}\n')
    for example in examples:
        lex = example[0].lower() + example[1:-5]
        ofi.write(f'foreign import {lex}URL :: String\n')
    ofi.write('newtype Examples = Examples {\n')
    for x, example in enumerate(examples):
        lex = example[0].lower() + example[1:-5]
        ofi.write(f' {lex} :: String')
        ofi.write('\n' if x == len(examples) - 1 else ',\n')
    ofi.write('}\n')
    ofi.write('derive instance Newtype Examples _\n')
    ofi.write('examples :: Examples\n')
    ofi.write('examples = Examples {\n')
    for x, example in enumerate(examples):
        lex = example[0].lower() + example[1:-5]
        ofi.write(f' {lex}: {lex}URL')
        ofi.write('\n' if x == len(examples) - 1 else ',\n')
    ofi.write(' }\n')
    ofi.write('data ExampleADT = '+(' | '.join([example[:-5] for example in examples]))+' \n')
    ofi.write('exampleToString :: ExampleADT -> String\n')
    for x, example in enumerate(examples):
        lex = example[0].lower() + example[1:-5]
        ofi.write(f'exampleToString {example[:-5]} = (unwrap examples).{lex}\n')
    ofi.write('exampleToSlug :: ExampleADT -> String\n')
    for x, example in enumerate(examples):
        lex = example[0].lower() + example[1:-5]
        bex = example[:-5]
        ofi.write(f'exampleToSlug {example[:-5]} = "{bex}"\n')
    ofi.write('exampleToApp :: ExampleADT -> ExampleSignature\n')
    for x, example in enumerate(examples):
        bex = example[:-5]
        ofi.write(f'exampleToApp {bex} = {bex}.app\n')

with open('./src/index.js','w') as ofi:
    def fprint(*args):
        ofi.write(' '.join(args)+'\n')
    fprint("import { main } from 'PureScript/Main/index.js'")
    for example in examples:
        lex = example[0].lower() + example[1:-5]
        bex = example[:-5]
        fprint(f'import * as {bex} from "PureScript/Examples.{bex}/index.js";')
    o = 'const toStart = import.meta.env.VITE_START;\n'
    for example in examples:
        lex = example[0].lower() + example[1:-5]
        bex = example[:-5]
        o += f'toStart === "{bex}" ? {bex}.main() : '
    o += 'main();'
    fprint(o)