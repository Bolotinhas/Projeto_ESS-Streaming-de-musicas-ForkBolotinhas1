// @ts-nocheck
const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const {addCucumberPreprocessorPlugin,} = require("@badeball/cypress-cucumber-preprocessor");
const {createEsbuildPlugin,} = require("@badeball/cypress-cucumber-preprocessor/esbuild");


module.exports = defineConfig({
  e2e: {
    async setupNodeEvents(on, config) {
      //ativa suporte ao cucumber
      await addCucumberPreprocessorPlugin(on, config);

      //diz ao Cypress como compilar .feature
      on(
        "file:preprocessor",
        createBundler({
          plugins: [createEsbuildPlugin(config)],})
      );

      return config;
    },

    //só roda .feature
    specPattern: "**/*.feature",
    //opcional mas recomendado site do frontend. site do backend vai ser 3000
    baseUrl: "http://localhost:3001",
    supportFile: "cypress/support/e2e.ts",
  },
});