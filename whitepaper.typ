= Optimized Tokenomics

since we cannot setup perfect tokenomics from the beginning, we should allow changes to tokenomics.  
let's treat tokenomics as an optimisation problem. we change parameters of our tokenomics and observe changes to a metric that we want to maximise.
we use some optimisation algorithm to dictate the next set of tokenomics parameters. and thus we continue until we reach an optimum.
in my opinion, an algorithm that works very well with multi-dimensional noisy data is the multi-start <Nelder-Mead>.

the parameters that can be changed would e.g. be the percentages of the tokens that are allocated for certain purposes.

changes to the tokenomics are generally controlled by the DAO, i.e. governance, i.e. the DAO token holders themselves, excluding the treasury itself.

the optimisation has to include restrictions, such as to not allow the increase of the creator allocation, as the creator initially holds the largest voting power and could keep increasing its own share.

the currently proposed metric to optimise is *TVL growth*.

== update

every aspect of tokenomics can change via governance except to increase the coins under the control of the creator.
changes are based on recommendations of a multi-dim optimisation.

== fixed parameters of tokenomics

whether the tokens can be (frozen or clawed back) xor not

% of tokens allocated for strategic actions. this will include giving tokens to the team, strategic partnerships, seed sale, public sales.
the owner of these is initially the creator. the creator can reduce this % anytime it wants, but it does not have power to increase the % ever.

the other % start out in the treasury and are used for the ecosystem. this includes rewarding coins for usage, promotion, for staking, for adding value in any way.

the % the creator intends to keep or less for the team. the team rewards would be vested over time using like <FairVesting>.

== flexibility

the broadness of our starting parameters should not be confused with vagueness. the broadness of our starting parameters allows us to optimise well.
the purpose of tokenomics optimization is to maintain flexibility. we do not know whether our network will function best if we give users x% for using the service or y%. let's find out by trying.

ideally, the governance token supply is as large as possible to maximise flexibility as well. it allows the <enterprise> to give very small rewards to begin with.
to avoid annoyance to humans, use <metricprefix>.

== precedence

the DAO has the power and should follow the recommendations of the multi-dim optimisation. however, the DAO can also go against the optimisations' advice.


== references
https://github.com/1m1-github/FairVesting  
https://en.wikipedia.org/wiki/Unit_prefix
