import maplibregl from 'maplibre-gl'

const Map = {
  mounted() {
    this.props = { id: this.el.getAttribute('data-id') }

    this.handleEvent(`map:${this.props.id}:init`, ({ spec }) => {
      const map = new maplibregl.Map({
        container: 'map',
        style: spec,
      })

      this.props.map = map
    })
  },
}

export default Map