# Pulse news website
This is a news portal made for journalists students of Karazina university (Kharkov, Ukraine).
Admin users create articles with active_admin & wysiwyg editor, regular users can read those articles and comment them.
To authenticate regular users could use standard devise authentication or sign in with Facebook or Vkontakte.

### Installation for development
1. Clone project
2. Use ruby 2.3.0 with rvm, install gems (`gem install bundler && bundle install`)
3. Rename config.*.example files 
4. Create database and run migrations and seeds
5. Start Sunspot Solr searching engine with `bundle exec rake sunspot:solr:start`
6. Sometimes it's better to reindex Solr with `bundle exec rake sunspot:solr:reindex`
 
