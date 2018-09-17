function rating = PlayerRating(stat, pos)
% function rating = PlayerRating(stat, pos)
% input: stat, pos
% output: rating
% does: uses all the rating calculating functions to save it into a struct

rating.cRat = CalculateCRating(pos.cIndex,stat);
rating.pgRat = CalculatePGRating(pos.pgIndex,stat);
rating.sgRat = CalculateSGRating(pos.sgIndex,stat);
rating.sfRat = CalculateSFRating(pos.sfIndex,stat);
rating.pfRat = CalculatePFRating(pos.pfIndex,stat);
end





