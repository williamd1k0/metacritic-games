set PLATFORM $argv[1]
set YEAR_START $argv[2]
set YEAR_END $argv[3]

for i in (seq $YEAR_START $YEAR_END)
    echo "Fetching $PLATFORM $i data"
    fish fetch-scores.fish $PLATFORM $i
end
