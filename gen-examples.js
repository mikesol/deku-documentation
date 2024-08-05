import fs from 'fs';
import path from 'path';

// Get list of examples
const examples = fs.readdirSync('./src/Examples').filter(x => x.includes('.purs'));

// Write Examples.js file
const examplesJsPath = path.join('./src', 'Examples.js');
const examplesJsContent = examples.map(example => {
    const lex = example[0].toLowerCase() + example.slice(1, -5);
    const examplePath = path.join('./src/Examples', example);
    const fileContent = fs.readFileSync(examplePath, 'utf-8').split('\n');

    let IN_IMPORTS = false;
    const O = [];

    fileContent.forEach(line => {
        if (line.startsWith('import')) {
            IN_IMPORTS = true;
            O.push(line);
        } else {
            if (IN_IMPORTS) {
                O.push('import Deku.Toplevel (runInBody)');
                IN_IMPORTS = false;
                O.push(line);
            } else if (line.startsWith('main')) {
                return;
            } else if (line.includes('let quit')) {
                return;
            } else {
                O.push(line);
            }
        }
    });

    const joined = O.join('\n')
        .replace('app :: ExampleSignature', 'main :: Effect Unit')
        .replace('app runExample =', 'main =')
        .replace('append <$> pure quit <*> runExample', 'void $ runInBody')
        .replace('runExample', 'void $ runInBody');

    return `export const ${lex}URL = ${JSON.stringify(joined)};\n`;
}).join('');

fs.writeFileSync(examplesJsPath, examplesJsContent);

// Write Examples.purs file
const examplesPursPath = path.join('./src', 'Examples.purs');
let examplesPursContent = `
module Examples (Examples(..), ExampleADT(..), examples, exampleToString, exampleToSlug, exampleToApp) where

import Data.Newtype (class Newtype, unwrap)
import ExampleAssitant (ExampleSignature)
`;

examples.forEach(example => {
    const lex = example.slice(0, -5);
    examplesPursContent += `import Examples.${lex} as ${lex}\n`;
});

examples.forEach(example => {
    const lex = example[0].toLowerCase() + example.slice(1, -5);
    examplesPursContent += `foreign import ${lex}URL :: String\n`;
});

examplesPursContent += `
newtype Examples = Examples {
`;

examples.forEach((example, index) => {
    const lex = example[0].toLowerCase() + example.slice(1, -5);
    examplesPursContent += ` ${lex} :: String${index === examples.length - 1 ? '\n' : ',\n'}`;
});

examplesPursContent += `
}

derive instance Newtype Examples _

examples :: Examples
examples = Examples {
`;

examples.forEach((example, index) => {
    const lex = example[0].toLowerCase() + example.slice(1, -5);
    examplesPursContent += ` ${lex}: ${lex}URL${index === examples.length - 1 ? '\n' : ',\n'}`;
});

examplesPursContent += `
}

data ExampleADT = ${examples.map(example => example.slice(0, -5)).join(' | ')} 

exampleToString :: ExampleADT -> String
`;

examples.forEach(example => {
    const lex = example[0].toLowerCase() + example.slice(1, -5);
    examplesPursContent += `exampleToString ${example.slice(0, -5)} = (unwrap examples).${lex}\n`;
});

examplesPursContent += `
exampleToSlug :: ExampleADT -> String
`;

examples.forEach(example => {
    const lex = example[0].toLowerCase() + example.slice(1, -5);
    examplesPursContent += `exampleToSlug ${example.slice(0, -5)} = "${example.slice(0, -5)}"\n`;
});

examplesPursContent += `
exampleToApp :: ExampleADT -> ExampleSignature
`;

examples.forEach(example => {
    const bex = example.slice(0, -5);
    examplesPursContent += `exampleToApp ${bex} = ${bex}.app\n`;
});

fs.writeFileSync(examplesPursPath, examplesPursContent);

// Write index.js file
const indexPath = path.join('./src', 'index.js');
const indexContent = [
    ...examples.map(example => {
        const lex = example[0].toLowerCase() + example.slice(1, -5);
        const bex = example.slice(0, -5);
        return `import * as ${bex} from "PureScript/Examples.${bex}/index.js";`;
    }),
    `const toStart = import.meta.env.VITE_START;\n`,
    examples.map(example => {
        const bex = example.slice(0, -5);
        return `toStart === "${bex}" ? ${bex}.main() : `;
    }).join('') + 'main();'
].join('\n');

fs.writeFileSync(indexPath, indexContent);
