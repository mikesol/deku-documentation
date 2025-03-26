import fs from 'fs'
import path from 'path'
import chokidar from 'chokidar'
import { globSync } from 'glob'

const outputDir = path.resolve(__dirname, 'output/Vike.*/index.js')

const createPageFiles = () => async (p) => {
  const dir = p.split('output/Vike.')[1].replace('/index.js', '')
  if (dir === 'FourOhFour') {
    return
  }
  fs.mkdirSync(`pages/${dir}`, { recursive: true })
  fs.writeFileSync(
    path.resolve(__dirname, `pages/${dir}/+Page.js`),
    `import { vike } from "${new Array(2)
      .fill('../')
      .join('')}output/Vike.${dir}"

export default vike.page;`,
  )

  // THIS code is deprecated bc of error
  // Error: [vike][Wrong Usage] The following import in /pages/GettingStarted/+route.js has no effect:
  //   import "toastify-js/src/toastify.css";
  // See https://vike.dev/config#pointer-imports
  //   fs.writeFileSync(
  //     path.resolve(__dirname, `pages/${dir}/+route.js`),
  //     `import { vike } from "${new Array(2)
  //       .fill('../')
  //       .join('')}output/Vike.${dir}"
  //
  // export default vike.route;`,
  //   )

  // Import p dynamically, then write route to file
  const {
    vike: { route },
  } = await import(p)

  // console.log('route', route)

  fs.writeFileSync(
    path.resolve(__dirname, `pages/${dir}/+route.js`),
    `export default ${JSON.stringify(route)};`,
  )
}

// write files here, not in buildStart, bc in buildStart it writes files after other plugins work (thus - error)
const files = globSync(outputDir)
files.forEach(createPageFiles('start'))

const dekuPlugin = () => {
  let config
  return {
    name: 'rollup-plugin-vike-deku',
    configResolved(resolvedConfig) {
      // store the resolved config
      config = resolvedConfig
    },
    buildStart() {
      if (config.command === 'serve') {
        const watcher = chokidar.watch(outputDir, { ignoreInitial: true })
        watcher.on('add', createPageFiles('add'))
        watcher.on('change', createPageFiles('change'))
        watcher.on('unlink', createPageFiles('unlink'))
        watcher.on('unlinkDir', createPageFiles('unlinkDir'))
      }
    },
  }
}

export default dekuPlugin
