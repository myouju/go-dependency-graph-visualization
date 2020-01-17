## Run
```
# first party package only
bash run.sh $GOPATH/src/$YOUR_REPO > darge.html

# with third party package
bash run_with_thirdparty.sh $GOPATH/src/$YOUR_REPO > darge.html
```

## View
```
open darge.html
```

## Generate image
### prepare
```
npm install puppeteer
```

### generate
```
node to_image.js
```

## sample image
![sample](https://gist.githubusercontent.com/myouju/5a15d4c6aef72c67ca09aed8a91d4d1f/raw/b583cd65bde70b11d7101e274bf9d981d09de971/sample.png)

### with third party
![sample_with_thirdparty](https://gist.githubusercontent.com/myouju/5a15d4c6aef72c67ca09aed8a91d4d1f/raw/6881fd7a54cf2f33b094d9bd7c7219e9bdee492d/sample_with_thirdparty.png)

