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

    this.handleEvent(`map:${this.props.id}:positions_updated`, ({ geojson }) => {
      this.props.map.getSource('realtime_positions').setData(geojson)
    })
  },
}

export default Map