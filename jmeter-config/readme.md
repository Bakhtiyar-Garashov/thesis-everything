I feel the importance of this document as it took me some time to realize the solution.

Firstly, thanks to this [comment](https://stackoverflow.com/a/69160951/13852458)

Context: So, if you just installed and started to use Jmeter after configuration step you will see that you have to save the configuration file to run the benchmark. 

Here the problem comes in:

The default theme and most of the themes which are come with Jmeter throw a runtime Java exception. So, consequently you are not able to run the benchmark.

Solution:

1. Open JMeter
2. Options -> Look and Feel
3. Select the theme called "System"
4. Restart Jmeter.

### Testing vector tile via Jmeter

As the vector tiles have specific URL layout with numeric indices, we need to create a custom HTTP request sampler to handle them. Here we can get benefit of the possible features to create random variables. We can either:

1. Add random variables to the CSV and read it
2. Generate random variables directly and use them in the request

We went with the second option.

Tutorial on that: https://www.blazemeter.com/blog/three-ways-to-generate-random-variables-in-jmeter