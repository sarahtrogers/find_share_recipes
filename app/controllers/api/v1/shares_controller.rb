class Api::V1::SharesController < Api::V1::GraphitiController
  def index
    shares = ShareResource.all(params)
    respond_with(shares)
  end

  def show
    share = ShareResource.find(params)
    respond_with(share)
  end

  def create
    share = ShareResource.build(params)

    if share.save
      render jsonapi: share, status: 201
    else
      render jsonapi_errors: share
    end
  end

  def update
    share = ShareResource.find(params)

    if share.update_attributes
      render jsonapi: share
    else
      render jsonapi_errors: share
    end
  end

  def destroy
    share = ShareResource.find(params)

    if share.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: share
    end
  end
end
