if [ -e "brakeman-report.json" ]
then
  bundle exec brakeman -z --compare brakeman-report.json -o brakeman-comparison.json -o brakeman-report.json
  bundle exec ruby brakeman-compare.rb
else
  bundle exec brakeman -z -o brakeman-report.json
fi
exit 0;