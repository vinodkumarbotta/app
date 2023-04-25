
module.exports = {
    ci: {
      collect: {
          url: ['https://www.hubler.app'],
          numberOfRuns: 5
      },
      upload: {
        target: 'filesystem',
        outputDir: 'reports'
      },
      // enforce limits
      assert: {
        assertions: {
          'categories:performance': ['error', {minScore: 0.8}],
          'categories:accessibility': ['error', {minScore: 0.8}],
          'categories:seo': ['error', {minScore: 0.8}],
          'categories:best-practices': ['error', {minScore: 0.8}]
          }
      }
    }
  };