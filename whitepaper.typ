= tokenomics and governance of 2i2i

2i2i is to be a DAO, governed and owned by the tokens of the DAO. this document is about those tokens.

== governance

governance is the act of making decisions for the system. the process of decision making is voting. each gov token will count equally towards the available options in a vote. proposals should generally be formulated such that there is a 'change' option and a 'no change' option. the 'change' option can have a required threshold (>= 50%). if the threshold is not met, the system remains unchanged. this lends the system stability and changes are only enacted if perceived as valuable enough.

we can have our governance completely on-chain, unlike the current governance of Algorand. to avoid double voting and without the possibility of querying transactions within an on-chain contract, the gov tokens need to be locked in the contract as long as voting is open.

at first glance, the locking of gov tokens seems restrictive towards the voter. this can be alleviated via the 'receipt' token.
when a voter locks their coins in the governance contract, they receive 1:1 receipt tokens in exchange. these tokens can be exchanged back to the gov tokens anytime after the voting period has ended.

should the receipt tokens be tradable? i.e. should the voter be economically bound to the gov token after declaring their vote but before all the voting ends?
both options are possible

=== receipt tokens are frozen

there is an argument that 'freezing' gov tokens is essential so accounts do not acquire the tokens, vote with malintent and immediately sell them; all this to harm the project or for trading gains.
if this is the overriding thinking of the project, they can simply have the receipt tokens frozen in the account.
Algorand has this requirement for it's own gov tokens, but solves the problem without receipt tokens because it counts the votes off-chain.

=== receipt tokens are not frozen

there are some arguments as well to allow trading of gov tokens after submitting one's own vote publicly but before the voting period has ended.

since the vote would be public, in theory, the malicious actor has no inside information. the market could react just as quickly as the malactor after their single vote. the malactor would need to acquire gov tokens, at a high cost assuming they buy a vote influencing amount. after voting and receiving receipt tokens, they could sell the receipt tokens, which again requires a high cost. the malactor only benefits if their vote is detrimental to the system and they sell their receipt tokens faster than the market and overcome the loss from buying and selling a large position.

on the other hand, for normal actors, a tradable receipt token represents freedom. they can vote and immediately use the receipt tokens elsewhere in DeFi instead of losing out. this makes voting a low and fixed cost effort.

rather than requiring accounts to freeze their gov tokens during long periods (e.g. months), we only need non-economic locking during the voting periods, which is a more precise solution. each vote is independent.

=== on-chain voting

other contracts, like e.g. an update contract, can depend on the result of a vote by asking the governance contract about the result.
the governance contract keeps the vote tally in it's own global state.
if the governance contract confirms the vote result for 'change', the update contract can update the system contract. in fact, the vote should be based on the update contract. voters are voting to allow or disallow the running of the update contract. this gives the community true power over the system code.


== optimised tokenomics

since we cannot setup perfect tokenomics from the beginning, we should allow changes to tokenomics.  
let's treat tokenomics as an optimisation problem. we change parameters of our tokenomics and observe changes to a metric that we want to maximise.
we use some optimisation algorithm to dictate the next set of tokenomics parameters. and thus we continue until we reach an optimum.
in my opinion, an algorithm that works very well with multi-dimensional noisy data is the multi-start Nelder-Mead.

the parameters that can be changed would e.g. be the percentages of the tokens that are allocated for certain purposes.

changes to the tokenomics are generally controlled by the DAO, i.e. governance, i.e. the DAO token holders themselves, excluding the treasury itself.

the optimisation has to include restrictions, such as to not allow the increase of the creator allocation, as the creator initially holds the largest voting power and could keep increasing its own share.

the currently proposed metric to optimise is **TVL growth**.

=== summmary

every aspect of tokenomics can change via governance except to increase the coins under the control of the creator.
changes are based on recommendations of a multi-dim optimisation.

=== fixed parameters of tokenomics

none of the tokens can be frozen or clawed back.

50% of the tokens are allocated for strategic actions. this will include giving tokens to the team, strategic partnerships, seed sale, public sales.
the owner of these 50% is initially the creator. the creator can reduce this % anytime it wants, but it does not have power to increase the % ever.

the other 50% start out in the treasury and are used for the ecosystem. this includes rewarding coins for e.g. using or promoting 2i2i, for staking, for adding value in any way.

the creator intends to keep 20% or less for the team. the team rewards would be vested over time, using something like AlgoVesting.

=== flexibility

the broadness of our starting parameters (2 buckets of 50% each) should not be confused with vagueness. the broadness of our starting parameters allows us to optimise well.
the purpose of tokenomics optimisation is to maintain flexibility. we do not know whether our network will function best if we give users x% for using 2i2i or y%. let's find out by trying.

note that the 2i2i token has a supply as large as possible (2^64-1) to maximise flexibility. it allows the DAO to give very small rewards to begin with.
on the minus side, all holdings become huge numbers; probs annoying for humans.

=== precedence

the DAO has the power and should follow the recommendations of the multi-dim optimisation. however, the DAO can also go against the optimisations' advice.

=== smart treasury

the treasury itself should ideally be a contract controlled by the DAO. this contract would store all the gov tokens and all fee tokens of the system. the treasury contract would allow any account to trade with it. besides secondary markets on DEXs for the gov token, the treasury contract could serve as the ultimate liquidity provider. this contract could e.g. award coins to helpers based on a vote by the DAO.

a non-50/50 AMM, which is what the smart treasury also contains, is difficult to implement in Algorand in high precision due to the limitation to 64bit values. it is possible in principle using multiple contracts. in a single contract, a 90/10 AMM could e.g. be implemented but not a 9999/1.

this smart treasury also automatically includes a buyback system. as fee coins accumulate in the treasury, arbitrageurs will buy 2i2i tokens in the secondary markets to sell them to the treasury contract. thereby increasing the tokens' price on the DEXs.

all gov token holders of the 2i2i DAO are also full participants of the fee coins collected by 2i2i. actually, the DAO can vote to pay e.g. operational costs (incl. taxes) from the fees coins directly. whatever is left over, is called profit.

=== initial parameters of tokenomics

amendment*: the below plan still seems plausible ~ since the total supply of coins is very large (2^64-1), handing out even 1 billionth of 1% is ca. 90 million coins ~ instead let's start by giving everyone 1 2i2i coin for everything ~ coin holders could always decide to burn a certain = of coins reducing supply

- each user at the of a 2i2i meeting will get 0.5% of the fee collected by 2i2i (which is 10% of the coins sent from Guest to Host) in the form of 2i2i (gov) tokens, but only if an exchange rate is known between the 2i2i token and the fee token.
is this rule safe? in theory, it should be. fees collected by 2i2i increase the value of the 2i2i token and a part of that is given to the user. it's a positive trade for the treasury.

the following is changed due to the amendment* above ~ we still maintain the idea of reaching this kind of numbers, but start by giving each user/tagger/etc. of 2i2i with 1 2i2i coin ~ at some point, we can burn some = of coins and then proceed to the tuning the below numbers:
- each user at the of a 2i2i meeting will also get 0.5\*10^-9\*1% of all 2i2i tokens. i.e. 1 billion meetings result in 1%.
- each tag of the @2i2i_app on twitter rewards the user 10^-6\*1% of all 2i2i tokens.
- each tag of the =2i2i on twitter rewards the user 10^-6\*0.5% of all 2i2i tokens.
- each blog post written with 2i2i mentioned rewards the user 10^-6\*2% of all 2i2i tokens.
- each video post made with 2i2i mentioned rewards the user 10^-6\*2.5% of all 2i2i tokens.
- each mention of 2i2i anywhere rewards the user 10^-6\*1% of all 2i2i tokens.  
these marketing rewards will have to be submitted by the claimer.

these tokenomics have a positive effect on the dynamics of the network.


== references
https://www.placeholder.vc/blog/2020/9/17/stop-burning-tokens-buyback-and-make-instead  
https://medium.com/borderless-capital/introduction-to-tokenomics-c7af75c09bfe  
https://github.com/1m1-github/AlgoVesting  
https://algoexplorer.io/asset/662477403  
